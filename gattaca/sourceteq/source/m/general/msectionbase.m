#import "msectionbase.h"

@implementation msectionbase

#pragma mark public

-(NSInteger)index
{
    return 0;
}

-(UIViewController*)controller
{
    return [[UIViewController alloc] init];
}

@end