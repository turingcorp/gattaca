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

-(void)sectionleft
{
    [[cmain singleton] opensection:[msection config] animated:YES];
}

-(void)sectionright
{
    [[cmain singleton] opensection:[msection contact] animated:YES];
}

@end