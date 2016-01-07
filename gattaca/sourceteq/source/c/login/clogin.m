#import "clogin.h"

@implementation clogin

+(void)asklogin:(BOOL)_animated
{
    dispatch_async(dispatch_get_main_queue(),
                   ^(void)
                   {
                       [[cmain singleton] presentViewController:[[clogin alloc] init] animated:_animated completion:nil];
                   });
}

-(void)loadView
{
    self.view = [[vlogin alloc] init];
}

@end