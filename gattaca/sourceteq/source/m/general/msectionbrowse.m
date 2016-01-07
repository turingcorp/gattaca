#import "msectionbrowse.h"

@implementation msectionbrowse

#pragma mark public

-(NSInteger)index
{
    return 1;
}

-(UIViewController*)controller
{
    return [[cbrowse alloc] init];
}

@end