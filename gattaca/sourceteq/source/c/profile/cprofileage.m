#import "cprofileage.h"

@implementation cprofileage

+(void)askage
{
    dispatch_async(dispatch_get_main_queue(),
                   ^(void)
                   {
                       [[cmain singleton] presentViewController:[[cprofileage alloc] init] animated:YES completion:nil];
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
    self.view = [[vprofileage alloc] init:self];
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [[analytics singleton] trackscreen:ga_screen_profile_age];
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}

-(BOOL)prefersStatusBarHidden
{
    return NO;
}

#pragma mark public

-(void)selectage:(NSInteger)age
{
    [[mmyprofile singleton] updateage:age];
    [[cmain singleton] dismissViewControllerAnimated:YES completion:nil];
}

@end