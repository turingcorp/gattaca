#import "cconfig.h"

@implementation cconfig

-(instancetype)init
{
    self = [super init];
    [self setModalPresentationStyle:UIModalPresentationOverCurrentContext];
    
    return self;
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [(vconfig*)self.view refresh];
}

-(void)loadView
{
    self.view = [[vconfig alloc] init:self];
}

@end