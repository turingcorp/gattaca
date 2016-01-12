#import "vconfigsettingslogout.h"

@implementation vconfigsettingslogout

-(instancetype)init:(cconfigsettingslogout*)controller
{
    self = [super init:controller];
    
    vblur *blur = [vblur dark];
    
    UILabel *descr = [[UILabel alloc] init];
    [descr setBackgroundColor:[UIColor clearColor]];
    [descr setTextAlignment:NSTextAlignmentCenter];
    [descr setFont:[UIFont fontWithName:fontname size:20]];
    [descr setNumberOfLines:0];
    [descr setUserInteractionEnabled:NO];
    [descr setTextColor:[UIColor whiteColor]];
    [descr setText:NSLocalizedString(@"config_settings_logout_descr", nil)];
    [descr setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    UIButton *cancel = [[UIButton alloc] init];
    [cancel setBackgroundColor:[UIColor colorWithWhite:1 alpha:0.8]];
    [cancel setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [cancel setTitleColor:[UIColor colorWithWhite:0 alpha:0.1] forState:UIControlStateHighlighted];
    [cancel setTitle:NSLocalizedString(@"config_settings_delete_cancel", nil) forState:UIControlStateNormal];
    [cancel.layer setCornerRadius:3];
    [cancel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [cancel addTarget:controller action:@selector(cancel) forControlEvents:UIControlEventTouchUpInside];
    
    FBSDKLoginButton *logout = [[FBSDKLoginButton alloc] init];
    [logout setTranslatesAutoresizingMaskIntoConstraints:NO];
    [logout setDelegate:controller];
    
    [self addSubview:blur];
    [self addSubview:descr];
    [self addSubview:cancel];
    [self addSubview:logout];
    
    NSDictionary *views = @{@"blur":blur, @"descr":descr, @"cancel":cancel, @"logout":logout};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[blur]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[descr]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[cancel]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[logout]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[blur]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-150-[descr]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[cancel(34)]-15-[logout(34)]-20-|" options:0 metrics:metrics views:views]];
    
    return self;
}

@end