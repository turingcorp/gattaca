#import "vgattacaend.h"

@implementation vgattacaend

-(instancetype)init:(cgattacaend*)controller
{
    self = [super init:controller];
    [self setClipsToBounds:YES];
    
    vblur *blur = [vblur dark];
    
    UILabel *lbl = [[UILabel alloc] init];
    [lbl setBackgroundColor:[UIColor clearColor]];
    [lbl setFont:[UIFont fontWithName:fontname size:20]];
    [lbl setTextColor:[UIColor whiteColor]];
    [lbl setTextAlignment:NSTextAlignmentCenter];
    [lbl setUserInteractionEnabled:NO];
    [lbl setNumberOfLines:0];
    [lbl setText:NSLocalizedString(@"gattaca_tester_ended", nil)];
    [lbl setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    UIButton *btn = [[UIButton alloc] init];
    [btn setBackgroundColor:[UIColor colorWithWhite:1 alpha:0.1]];
    [btn.layer setCornerRadius:4];
    [btn setClipsToBounds:YES];
    [btn.titleLabel setFont:[UIFont fontWithName:fontboldname size:17]];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor colorWithWhite:1 alpha:0.1] forState:UIControlStateHighlighted];
    [btn setTranslatesAutoresizingMaskIntoConstraints:NO];
    [btn addTarget:self action:@selector(actionend) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:NSLocalizedString(@"gattaca_tester_accept", nil) forState:UIControlStateNormal];
    
    [self addSubview:blur];
    [self addSubview:lbl];
    [self addSubview:btn];
    
    NSDictionary *views = @{@"blur":blur, @"btn":btn, @"lbl":lbl};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[blur]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[blur]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[lbl]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[btn]-50-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-250-[lbl]-20-[btn(44)]" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark actions

-(void)actionend
{
    [(cgattacaend*)self.controller accept];
}

@end