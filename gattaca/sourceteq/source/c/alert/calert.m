#import "calert.h"

@implementation calert

+(void)show:(NSString*)message
{
    dispatch_async(dispatch_get_main_queue(),
                   ^(void)
                   {
                       [[cmain singleton] presentViewController:[[calert alloc] init:message] animated:NO completion:nil];
                   });
}

-(instancetype)init:(NSString*)message
{
    self = [super init];
    [self setModalPresentationStyle:UIModalPresentationOverCurrentContext];
    
    self.message = message;
    
    return self;
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}

-(BOOL)prefersStatusBarHidden
{
    return NO;
}

-(void)loadView
{
    self.view = [[valert alloc] init:self];
}

#pragma mark public

-(void)accept
{
    [[cmain singleton] dismissViewControllerAnimated:YES completion:nil];
}

@end