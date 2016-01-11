#import "vconfigsettingsdelete.h"

@implementation vconfigsettingsdelete

-(instancetype)init:(cconfigsettingsdelete*)controller
{
    self = [super init:controller];
 
    vblur *blur = [vblur dark];
    
    UILabel *descr = [[UILabel alloc] init];
    [descr setBackgroundColor:[UIColor clearColor]];
    [descr setTextAlignment:NSTextAlignmentCenter];
    [descr setFont:[UIFont fontWithName:fontname size:18]];
    [descr setNumberOfLines:0];
    [descr setUserInteractionEnabled:NO];
    [descr setText:NSLocalizedString(@"config_settings_delete_descr", nil)];
    [descr setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    UIButton *cancel = [[UIButton alloc] init];
    [cancel setBackgroundColor:[UIColor colorWithWhite:1 alpha:0.8]];
    [cancel setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [cancel setTitleColor:[UIColor colorWithWhite:0 alpha:0.2] forState:UIControlStateHighlighted];
    [cancel setTitle:NSLocalizedString(@"config_settings_delete_cancel", nil) forState:UIControlStateNormal];
    [cancel.layer setCornerRadius:3];
    [cancel setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    UIButton *delete = [[UIButton alloc] init];
    [delete setBackgroundColor:[UIColor redColor]];
    [delete setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [delete setTitleColor:[UIColor colorWithWhite:1 alpha:0.2] forState:UIControlStateHighlighted];
    [delete setTitle:NSLocalizedString(@"config_settings_delete_delete", nil) forState:UIControlStateNormal];
    [delete.layer setCornerRadius:3];
    [delete setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self addSubview:blur];
    
    NSDictionary *views = @{@"blur":blur, @"descr":descr, @"cancel":cancel, @"delete":delete};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[blur]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[descr]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[cancel]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[delete]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[blur]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-100-[descr]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[cancel(34)]-10-[delete(34)]-20-|" options:0 metrics:metrics views:views]];
    
    return self;
}

@end