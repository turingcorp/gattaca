#import "cprofilename.h"

@implementation cprofilename

+(void)askname
{
    dispatch_async(dispatch_get_main_queue(),
                   ^(void)
                   {
                       [[cmain singleton] presentViewController:[[cprofilename alloc] init] animated:YES completion:nil];
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
    self.view = [[vprofilename alloc] init:self];
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [[analytics singleton] trackscreen:ga_screen_profile_name];
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

-(void)selectname:(profile_name)type
{
    [[NSNotificationCenter defaultCenter] postNotificationName:notprofileupdate object:nil];
    
//    [[analytics singleton] trackevent:ga_event_profile_age action:ga_action_changed label:[NSString stringWithFormat:@"%@", @(age)]];
//    [[mmyprofile singleton] updateage:age];
//    [[cmain singleton] dismissViewControllerAnimated:YES completion:nil];
}

@end