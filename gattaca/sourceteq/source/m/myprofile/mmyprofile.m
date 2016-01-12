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
    [self loaduser];
    
    return self;
}

#pragma mark functionality

-(void)firsttime
{
    self.age = 21;
    self.gender = profile_gender_female;
    self.nametype = profile_name_firstname;
    self.namestr = NSLocalizedString(@"profile_default_user", nil);
    
    NSInteger now = [NSDate date].timeIntervalSince1970;
    NSString *query = [NSString stringWithFormat:
                       @"INSERT INTO profile (created, syncstamp, updated, name, namestr, age, gender) "
                       "VALUES(%@, 0, %@, %@, \"%@\", %@, %@);",
                       @(now), @(now), @(self.nametype), self.namestr, @(self.age), @(self.gender)];
    
    [db query:query];
}

-(void)saveuser
{
    NSInteger now = [NSDate date].timeIntervalSince1970;
    NSString *query = [NSString stringWithFormat:
                       @"UPDATE profile set updated=%@, name=%@, namestr=\"%@\", age=%@, gender=%@",
                       @(now), @(self.nametype), self.namestr, @(self.age), @(self.gender)];
    
    [db query:query];
}

#pragma mark public

-(void)loaduser
{
    NSString *query = @"SELECT name, namestr, age, gender FROM profile limit 1;";
    NSDictionary *rawuser = [db row:query];
    
    if(rawuser)
    {
        self.nametype = (profile_name)[rawuser[@"name"] integerValue];
        self.namestr = rawuser[@"namestr"];
        self.age = [rawuser[@"age"] integerValue];
        self.gender = (profile_gender)[rawuser[@"gender"] integerValue];
    }
    else
    {
        [self firsttime];
    }
}

-(void)updatename:(NSString*)newname
{
    self.namestr = newname;
    
    [self saveuser];
}

-(void)changenameto:(profile_name)nametype name:(NSString*)newname;
{
    self.nametype = nametype;
    self.namestr = newname;
    
    [self saveuser];
}

-(void)updategender:(profile_gender)newgender
{
    self.gender = newgender;
    
    [self saveuser];
}

-(void)updateage:(NSInteger)newage
{
    self.age = newage;
    
    [self saveuser];
}

@end