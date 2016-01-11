#import "cconfigprofile.h"

@implementation cconfigprofile

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [[analytics singleton] trackscreen:ga_screen_config_profile];
}

@end