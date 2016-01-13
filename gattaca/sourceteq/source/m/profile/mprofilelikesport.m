#import "mprofilelikesport.h"

@implementation mprofilelikesport
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
    return profile_like_sport;
}

-(UIColor*)color
{
    return [UIColor colorWithRed:0.4 green:0.5 blue:0.9 alpha:1];
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