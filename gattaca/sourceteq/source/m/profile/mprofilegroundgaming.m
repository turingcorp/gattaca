#import "mprofilegroundgaming.h"

@implementation mprofilegroundgaming
{
    NSInteger current;
}

-(instancetype)init:(NSInteger)amount
{
    self = [super init];
    
    current = amount;
    
    return self;
}

#pragma mark -
#pragma mark ground protocol

-(profile_ground)type
{
    return profile_ground_gaming;
}

-(UIColor*)color
{
    return [UIColor colorWithRed:0.4 green:0.8 blue:0.3 alpha:1];
}

-(NSInteger)currentamount
{
    return current;
}

-(void)newamount:(NSInteger)newamount
{
    current = newamount;
}

@end