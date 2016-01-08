#import "ccontact.h"

@implementation ccontact

-(instancetype)init
{
    self = [super init];
    [self setModalPresentationStyle:UIModalPresentationOverCurrentContext];
    
    return self;
}

-(void)loadView
{
    self.view = [[vcontact alloc] init:self];
}

@end