#import "mprofilegroundenter.h"

@implementation mprofilegroundenter
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
    return profile_ground_entertainment;
}

-(UIColor*)color
{
    return [UIColor colorWithRed:0.3 green:0.5 blue:0.7 alpha:1];
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