#import "cconfigsettingsdelete.h"

@implementation cconfigsettingsdelete

+(void)askconfirmation
{
    dispatch_async(dispatch_get_main_queue(),
                   ^(void)
                   {
                       
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
    self.view = [[vconfigsettingsdelete alloc] init];
}

@end