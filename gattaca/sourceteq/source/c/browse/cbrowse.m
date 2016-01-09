#import "cbrowse.h"

@implementation cbrowse

-(instancetype)init
{
    self = [super init];
    [self setModalPresentationStyle:UIModalPresentationOverCurrentContext];
    
    return self;
}

-(void)loadView
{
    self.view = [[vbrowse alloc] init:self];
}

#pragma mark public


@end