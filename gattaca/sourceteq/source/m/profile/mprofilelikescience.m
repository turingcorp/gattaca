#import "mprofilelikescience.h"

@implementation mprofilelikescience
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
    return profile_like_science;
}

-(UIColor*)color
{
    return [UIColor colorWithRed:0.5 green:0.6 blue:0.7 alpha:1];
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