#import "cgattacaend.h"

@implementation cgattacaend

+(void)finish:(mgattacatest*)test
{
    dispatch_async(dispatch_get_main_queue(),
                   ^(void)
                   {
                       [[cmain singleton] presentViewController:[[cgattacaend alloc] init:test] animated:YES completion:nil];
                   });
}

-(instancetype)init:(mgattacatest*)test
{
    self = [super init];

    self.test = test;
    [self setModalPresentationStyle:UIModalPresentationOverCurrentContext];
    
    return self;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setTitle:NSLocalizedString(@"gattaca_main_title", nil)];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^{
                       [self.test scoreall];
                   });
}

-(void)loadView
{
    self.view = [[vgattacaend alloc] init:self];
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

-(BOOL)prefersStatusBarHidden
{
    return NO;
}

#pragma mark public

-(void)cancel
{
    [[cmain singleton] dismissViewControllerAnimated:YES completion:
     ^{
         [[NSNotificationCenter defaultCenter] postNotificationName:notprofileupdate object:nil];
     }];
}

@end