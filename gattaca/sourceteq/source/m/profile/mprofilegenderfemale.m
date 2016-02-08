#import "mprofilegenderfemale.h"

@implementation mprofilegenderfemale

-(instancetype)init
{
    self = [super init];
    
    self.type = profile_gender_female;
    
    return self;
}

#pragma mark -
#pragma mark gender

-(UIColor*)color
{
    return [UIColor colorWithRed:1 green:0.6 blue:0.9 alpha:1];
}


@end