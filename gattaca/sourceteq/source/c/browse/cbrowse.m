#import "cbrowse.h"

@implementation cbrowse

-(void)loadView
{
    self.view = [[vbrowse alloc] init:self];
}

#pragma mark public

-(void)sectionleft
{
    [[cmain singleton] opensection:[msection config] animated:YES];
}

-(void)sectionright
{
    [[cmain singleton] opensection:[msection contact] animated:YES];
}

@end