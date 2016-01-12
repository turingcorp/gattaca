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
    
    return self;
}

#pragma mark functionality

-(void)loaduser
{
    NSString *query = @"SELECT name, namestr, age, latitude, longitude FROM profile";
}

-(void)firsttime
{
    self.latitude = 0;
    self.longitude = 0;
    self.age = 50;
    self.nametype = profile_name_firstname;
    self.namestr = @"";
    
    NSInteger now = [NSDate date].timeIntervalSince1970;
    NSString *query = [NSString stringWithFormat:
                       @"INSERT INTO profile (created, syncstamp, name, namestr, age, latitude, longitude) "
                       "VALUES(%@, 0, %@, \"%@\", %@, %@, %@);",
                       @(now), @(self.nametype), self.namestr, @(self.age), @(self.latitude), @(self.longitude)];
    
    [db query:query];
}

@end