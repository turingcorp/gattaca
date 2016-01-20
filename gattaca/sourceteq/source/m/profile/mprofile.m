#import "mprofile.h"

@implementation mprofile

-(instancetype)init
{
    self = [super init];
    
    return self;
}

#pragma mark public

-(void)loadstats
{
    self.like = [[mprofilelike alloc] init];
    self.ground = [[mprofileground alloc] init];
}

-(void)loadstats:(NSDictionary*)json
{
    
}

-(void)changegender:(profile_gender)gender
{
    self.gender = [mprofilegender gender:gender];
}

@end