#import "cmain.h"

@implementation cmain

+(instancetype)singleton
{
    static cmain *single;
    static dispatch_once_t once;
    dispatch_once(&once, ^(void) { single = [[self alloc] init]; });
    
    return single;
}

-(instancetype)init
{
    self = [super initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    [self setModalPresentationStyle:UIModalPresentationOverCurrentContext];

    if([msession singleton].userid)
    {
        [self opensection:[msection browse] animated:NO];
    }
    else
    {
        [clogin asklogin:NO];
    }
    
    return self;
}

#pragma mark public

-(void)opensection:(id<msectionprotocol>)section animated:(BOOL)_animated
{
    UIPageViewControllerNavigationDirection direction = UIPageViewControllerNavigationDirectionForward;
    UIViewController *controller = [section controller];
    
    if([section section] < [self.section section])
    {
        direction = UIPageViewControllerNavigationDirectionReverse;
    }
    
    self.section = section;
    [self setViewControllers:@[controller] direction:direction animated:_animated completion:nil];
}

@end