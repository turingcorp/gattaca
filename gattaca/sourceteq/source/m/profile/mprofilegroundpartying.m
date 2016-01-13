#import "mprofilegroundpartying.h"

@implementation mprofilegroundpartying
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
    return profile_ground_partying;
}

-(UIColor*)color
{
    return [UIColor colorWithRed:1 green:0.95 blue:0.3 alpha:1];
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