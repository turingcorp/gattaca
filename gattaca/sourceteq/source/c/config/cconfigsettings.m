#import "cconfigsettings.h"

@implementation cconfigsettings

-(instancetype)init
{
    self = [super init];
    [self setTitle:@"mao tao"];
    
    return self;
}

-(void)loadView
{
    self.view = [[vconfigsettings alloc] init];
}

@end