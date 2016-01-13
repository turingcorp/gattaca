#import "mprofilelikesocial.h"

@implementation mprofilelikesocial
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
#pragma mark like protocol

-(profile_like)type
{
    return profile_like_social;
}

-(UIColor*)color
{
    return [UIColor colorWithRed:0.5 green:0.6 blue:1 alpha:1];
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