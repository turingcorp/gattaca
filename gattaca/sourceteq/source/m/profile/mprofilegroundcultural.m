#import "mprofilegroundcultural.h"

@implementation mprofilegroundcultural
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
    return profile_ground_cultural;
}

-(UIColor*)color
{
    return [UIColor colorWithRed:0.3 green:0.7 blue:0.2 alpha:1];
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