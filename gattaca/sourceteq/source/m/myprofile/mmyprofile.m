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
    self.age = 50;
    self.nametype = profile_name_firstname;
    self.namestr = NSLocalizedString(@"profile_default_user", nil);
    
    NSInteger now = [NSDate date].timeIntervalSince1970;
    NSString *query = [NSString stringWithFormat:
                       @"INSERT INTO profile (created, syncstamp, updated, name, namestr, age) "
                       "VALUES(%@, 0, %@, %@, \"%@\", %@);",
                       @(now), @(now), @(self.nametype), self.namestr, @(self.age)];
    
    [db query:query];
}

-(void)saveuser
{
    
}

#pragma mark public

-(void)loaduser
{
    NSString *query = @"SELECT name, namestr, age FROM profile limit 1;";
    NSDictionary *rawuser = [db row:query];
    
    if(rawuser)
    {
        self.nametype = (profile_name)[rawuser[@"name"] integerValue];
        self.namestr = rawuser[@"namestr"];
        self.age = [rawuser[@"age"] integerValue];
    }
    else
    {
        [self firsttime];
    }
}

-(void)updatename:(NSString*)newname
{
    self.namestr = newname;
}

-(void)changenameto:(profile_name)nametype name:(NSString*)newname;
{
    self.nametype = nametype;
    self.namestr = newname;
}

@end