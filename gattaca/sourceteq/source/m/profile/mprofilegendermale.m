#import "mprofilegendermale.h"

@implementation mprofilegendermale

-(instancetype)init
{
    self = [super init];
    
    self.type = profile_gender_male;
    
    return self;
}

#pragma mark -
#pragma mark gender

-(UIColor*)color
{
    return [UIColor colorWithRed:1 green:0.7 blue:0 alpha:1];
}

@end