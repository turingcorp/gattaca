#import "vgattacatesterfooter.h"

@implementation vgattacatesterfooter

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    
    UIButton *btn = [[UIButton alloc] init];
    [btn setBackgroundColor:[UIColor colorWithWhite:0 alpha:0.2]];
    [btn setTitleColor:[UIColor colorWithWhite:1 alpha:0.6] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor colorWithWhite:1 alpha:0.1] forState:UIControlStateHighlighted];
    [btn setTitle:NSLocalizedString(@"gattaca_tester_btn_cancel", nil) forState:UIControlStateNormal];
    [btn setTranslatesAutoresizingMaskIntoConstraints:NO];
    [btn addTarget:self action:@selector(actioncancel) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:btn];
    
    NSDictionary *views = @{@"btn":btn};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[btn]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[btn]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark functionality

-(void)actioncancel
{
    [self.controller cancel];
}

@end