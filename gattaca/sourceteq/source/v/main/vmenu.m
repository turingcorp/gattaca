#import "vmenu.h"

@implementation vmenu

+(void)addto:(UIView*)view
{
    vmenu *menu = [[vmenu alloc] init];
    
    [view addSubview:menu];
    
    NSDictionary *views = @{@"menu":menu};
    NSDictionary *metrics = @{};
    
    [view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[menu]-0-|" options:0 metrics:metrics views:views]];
    [view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[menu(70)]-0-|" options:0 metrics:metrics views:views]];
}

-(instancetype)init
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self setBackgroundColor:[UIColor redColor]];
    
    vblur *blur = [vblur light];
    
//    [self addSubview:blur];
    
    return self;
}

@end