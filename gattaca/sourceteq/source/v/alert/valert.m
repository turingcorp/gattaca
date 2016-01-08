#import "valert.h"

@implementation valert

-(instancetype)init:(calert*)controller
{
    self = [super init];
    self.controller = controller;
    vblur *blur = [vblur light];
    
    UILabel *lbl = [[UILabel alloc] init];
    [lbl setBackgroundColor:[UIColor clearColor]];
    [lbl setTextAlignment:NSTextAlignmentCenter];
    [lbl setNumberOfLines:0];
    [lbl setFont:[UIFont fontWithName:fontname size:22]];
    [lbl setTextColor:[UIColor colorWithWhite:0 alpha:0.9]];
    [lbl setUserInteractionEnabled:NO];
    [lbl setText:controller.message];
    [lbl setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    UIButton *btn = [[UIButton alloc] init];
    [btn setBackgroundColor:[UIColor colorWithWhite:0 alpha:0.05]];
    [btn setTitle:NSLocalizedString(@"alert_accept", nil) forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor colorWithWhite:0 alpha:0.1] forState:UIControlStateHighlighted];
    [btn.titleLabel setFont:[UIFont fontWithName:fontboldname size:20]];
    [btn setTranslatesAutoresizingMaskIntoConstraints:NO];
    [btn addTarget:controller action:@selector(accept) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:blur];
    [self addSubview:lbl];
    [self addSubview:btn];
    
    NSDictionary *views = @{@"blur":blur, @"lbl":lbl, @"btn":btn};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[blur]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[blur]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[lbl]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[btn]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[lbl]-0-[btn(70)]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

@end