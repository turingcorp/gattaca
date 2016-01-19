#import "cgattacatester.h"

@implementation cgattacatester

+(void)start
{
    dispatch_async(dispatch_get_main_queue(),
                   ^(void)
                   {
                       [[cmain singleton] presentViewController:[[cgattacatester alloc] init] animated:YES completion:nil];
                   });
}

-(instancetype)init
{
    self = [super init];
    
    [self setModalPresentationStyle:UIModalPresentationOverCurrentContext];
    self.test = [mgattacatest test];
    
    return self;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setTitle:NSLocalizedString(@"gattaca_main_title", nil)];
}

-(void)loadView
{
    self.view = [[vgattaca alloc] init:self];
    self.viewtester = (vgattacatester*)self.view;
    
    [self showcurrent];
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

-(BOOL)prefersStatusBarHidden
{
    return NO;
}

#pragma mark functionality

-(void)showcurrent
{
    [self.viewtester load:[self.test current]];
}

#pragma mark public

-(void)cancel
{
    [[cmain singleton] dismissViewControllerAnimated:YES completion:
     ^{
         [[NSNotificationCenter defaultCenter] postNotificationName:notprofileupdate object:nil];
     }];
}

-(void)nextstep
{
    if([self.test next])
    {
        [self showcurrent];
    }
    else
    {
        // done
    }
}

@end