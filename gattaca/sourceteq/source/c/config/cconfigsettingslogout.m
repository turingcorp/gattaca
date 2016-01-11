#import "cconfigsettingslogout.h"

@implementation cconfigsettingslogout

+(void)askconfirmation
{
    dispatch_async(dispatch_get_main_queue(),
                   ^(void)
                   {
                       [[cmain singleton] presentViewController:[[cconfigsettingslogout alloc] init] animated:YES completion:nil];
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
    self.view = [[vconfigsettingslogout alloc] init:self];
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [[analytics singleton] trackscreen:ga_screen_logout];
}

@end