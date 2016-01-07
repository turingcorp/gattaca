#import "msectioncontact.h"

@implementation msectioncontact

#pragma mark public

-(NSInteger)index
{
    return 2;
}

-(UIViewController*)controller
{
    return [[ccontact alloc] init];
}

@end