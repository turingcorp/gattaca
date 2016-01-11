#import "vconfigsettingslogout.h"

@implementation vconfigsettingslogout

-(instancetype)init:(cconfigsettingslogout*)controller
{
    self = [super init:controller];
    
    vblur *blur = [vblur dark];
    
    [self addSubview:blur];
    
    NSDictionary *views = @{@"blur":blur};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[blur]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[blur]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

@end