#import "vconfigprofileheader.h"

@implementation vconfigprofileheader

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    
    vprofilecircle *circle = [[vprofilecircle alloc] init:[mmyprofile singleton].profile];
    
    UIButton *btn = [[UIButton alloc] init];
    [btn setClipsToBounds:YES];
    [btn setTitleColor:colormain forState:UIControlStateNormal];
    [btn setTitleColor:[colormain colorWithAlphaComponent:0.3] forState:UIControlStateHighlighted];
    [btn setTitle:NSLocalizedString(@"config_profile_btnedit", nil) forState:UIControlStateNormal];
    [btn setBackgroundColor:[colormain colorWithAlphaComponent:0.1]];
    [btn.titleLabel setFont:[UIFont fontWithName:fontboldname size:15]];
    [btn.layer setCornerRadius:4];
    [btn addTarget:self action:@selector(actioneditprofile) forControlEvents:UIControlEventTouchUpInside];
    [btn setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self addSubview:circle];
    [self addSubview:btn];
    
    NSDictionary *views = @{@"circle":circle, @"btn":btn};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[circle]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[btn(50)]-0-[circle]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-100-[btn]-100-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark actions

-(void)actioneditprofile
{
    
}

@end