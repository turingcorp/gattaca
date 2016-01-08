#import "cconfig.h"

@implementation cconfig

-(instancetype)init
{
    self = [super init];
    [self setModalPresentationStyle:UIModalPresentationOverCurrentContext];
    
    return self;
}

-(void)loadView
{
    self.view = [[vconfig alloc] init:self];
}

@end