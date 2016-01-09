#import "vconfigsettings.h"

@implementation vconfigsettings

-(instancetype)init:(cconfigsettings*)controller
{
    self = [super init];
    [self setBackgroundColor:[UIColor whiteColor]];

    self.controller = controller;
    
    return self;
}

@end