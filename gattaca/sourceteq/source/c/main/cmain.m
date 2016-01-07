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
    [self setViewControllers:@[[[cbrowse alloc] init]] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    return self;
}

#pragma mark public

-(void)changesection:(appsection)section
{
    if(self.section != section)
    {
        UIViewController *controller;
        
        switch(section)
        {
            case appsectionconfig:
                
                break;
                
            case appsectionbrowse:
                
                break;
                
            case appsectioncontact:
                
                break;
        }
    }
}

@end