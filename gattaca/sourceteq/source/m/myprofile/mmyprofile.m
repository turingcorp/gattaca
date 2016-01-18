#import "mmyprofile.h"

@implementation mmyprofile

+(instancetype)singleton
{
    static mmyprofile *single;
    static dispatch_once_t once;
    dispatch_once(&once, ^(void) { single = [[self alloc] init]; });
    
    return single;
}

-(instancetype)init
{
    self = [super init];
    
    self.coordsactive = NO;
    self.profile = [[mprofile alloc] init];
    [self loaduser];
    
    return self;
}

#pragma mark functionality

-(void)firsttime
{
    self.profile.age = 0;
    self.profile.gender = profile_gender_female;
    self.nametype = profile_name_firstname;
    self.profile.name = NSLocalizedString(@"profile_default_user", nil);
    
    NSInteger now = [NSDate date].timeIntervalSince1970;
    NSString *query = [NSString stringWithFormat:
                       @"INSERT INTO profile (created, syncstamp, updated, name, namestr, age, gender) "
                       "VALUES(%@, 0, %@, %@, \"%@\", %@, %@);",
                       @(now), @(now), @(self.nametype), self.profile.name, @(self.profile.age), @(self.profile.gender)];
    
    [db query:query];
}

-(void)saveuser
{
    NSInteger now = [NSDate date].timeIntervalSince1970;
    NSString *query = [NSString stringWithFormat:
                       @"UPDATE profile set updated=%@, name=%@, namestr=\"%@\", age=%@, gender=%@;",
                       @(now), @(self.nametype), self.profile.name, @(self.profile.age), @(self.profile.gender)];
    
    [db query:query];
}

-(void)loadstats
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^(void)
                   {
                       [self.profile loadstats];
                   });
}

#pragma mark public

-(void)loaduser
{
    NSString *query = @"SELECT id, name, namestr, age, gender FROM profile;";
    NSDictionary *rawuser = [db row:query];
    
    if(rawuser[@"id"])
    {
        self.nametype = (profile_name)[rawuser[@"name"] integerValue];
        self.profile.name = rawuser[@"namestr"];
        self.profile.age = [rawuser[@"age"] integerValue];
        self.profile.gender = (profile_gender)[rawuser[@"gender"] integerValue];
    }
    else
    {
        [self firsttime];
    }
    
    [self loadstats];
}

-(void)updatename:(NSString*)newname
{
    self.profile.name = newname;
    
    [self saveuser];
}

-(void)changenameto:(mmyprofilename*)name
{
    self.nametype = name.type;
    self.profile.name = name.value;
    
    [self saveuser];
}

-(void)updategender:(profile_gender)newgender
{
    self.profile.gender = newgender;
    
    [self saveuser];
}

-(void)updateage:(NSInteger)newage
{
    self.profile.age = newage;
    
    [self saveuser];
}

@end