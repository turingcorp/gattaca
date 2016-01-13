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
    return [UIColor colorWithRed:1 green:0.2 blue:0 alpha:1];
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