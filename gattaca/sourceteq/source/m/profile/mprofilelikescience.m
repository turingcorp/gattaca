#import "mprofilelikescience.h"

@implementation mprofilelikescience
{
    NSInteger qty;
}

-(instancetype)init:(NSInteger)amount
{
    self = [super init];
    
    qty = amount;
    
    return self;
}

#pragma mark -
#pragma mark like protocol

-(profile_like)type
{
    return profile_like_science;
}

-(NSInteger)amount
{
    return qty;
}

-(UIColor*)color
{
    return [UIColor colorWithRed:1 green:0.2 blue:0 alpha:1];
}

-(void)updateamount:(NSInteger)newamount
{
    qty = newamount;
    
}

@end