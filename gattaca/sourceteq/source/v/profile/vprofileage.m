#import "vprofileage.h"

@implementation vprofileage

-(instancetype)init:(cprofileage*)controller
{
    self = [super init:controller];
    [self setBackgroundColor:[UIColor clearColor]];
    
    vblur *blur = [vblur light];
    
    UIButton *btnaccept = [[UIButton alloc] init];
    [btnaccept setBackgroundColor:colormain];
    [btnaccept setClipsToBounds:YES];
    [btnaccept setTitle:NSLocalizedString(@"profile_age_btnaccept", nil) forState:UIControlStateNormal];
    [btnaccept setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btnaccept setTitleColor:[UIColor colorWithWhite:1 alpha:0.1] forState:UIControlStateHighlighted];
    [btnaccept.titleLabel setFont:[UIFont fontWithName:fontboldname size:16]];
    [btnaccept.layer setCornerRadius:3];
    [btnaccept setTranslatesAutoresizingMaskIntoConstraints:NO];
    [btnaccept addTarget:self action:@selector(actionaccept) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:blur];
    [self addSubview:btnaccept];
    
    NSDictionary *views = @{@"blur":blur, @"btn":btnaccept};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[blur]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[blur]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[btn]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[btn(36)]-20-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark actions

-(void)actionaccept
{
    [(cprofileage*)self.controller selectage:0];
}

@end