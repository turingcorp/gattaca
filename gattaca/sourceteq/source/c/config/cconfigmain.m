#import "cconfigmain.h"

@implementation cconfigmain

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:NSLocalizedString(@"config_title", nil)];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.viewconfig refresh];
}

-(void)loadView
{
    self.view = [[vconfig alloc] init:self];
    self.viewconfig = (vconfig*)self.view;
}

#pragma mark public

-(void)push:(id<mconfigprotocol>)item
{
    [self.navigationController pushViewController:[item controller] animated:YES];
}

@end