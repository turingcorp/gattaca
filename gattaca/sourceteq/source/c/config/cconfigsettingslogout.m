#import "cconfigsettingslogout.h"

@implementation cconfigsettingslogout

+(void)askconfirmation
{
    
}

-(instancetype)init
{
    self = [super init];
    
    [self setModalPresentationStyle:UIModalPresentationOverCurrentContext];
    
    return self;
}

-(void)loadView
{
    self.view = [[vconfigsettingslogout alloc] init];
}

@end