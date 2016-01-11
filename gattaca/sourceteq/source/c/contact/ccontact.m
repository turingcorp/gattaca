#import "ccontact.h"

@implementation ccontact

-(instancetype)init
{
    self = [super init];
    
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
    self.view = [[vcontact alloc] init:self];
}

@end