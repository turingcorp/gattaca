#import "calert.h"

@implementation calert

+(void)show
{
    dispatch_async(dispatch_get_main_queue(),
                   ^(void)
                   {
                       [[cmain singleton] presentViewController:[[calert alloc] init] animated:NO completion:nil];
                   });
}

-(instancetype)init
{
    self = [super init];
    [self setModalPresentationStyle:UIModalPresentationOverCurrentContext];
    
    return self;
}

-(void)loadView
{
    self.view = [[valert alloc] init];
}

@end