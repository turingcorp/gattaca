#import "cgattaca.h"

@implementation cgattaca

+(void)test
{
    dispatch_async(dispatch_get_main_queue(),
                   ^(void)
                   {
                       [[cmain singleton] presentViewController:[[cgattaca alloc] init] animated:YES completion:nil];
                   });
}

-(instancetype)init
{
    self = [super initWithRootViewController:[[cgattacamain alloc] init]];
    
    return self;
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

-(BOOL)prefersStatusBarHidden
{
    return NO;
}

@end