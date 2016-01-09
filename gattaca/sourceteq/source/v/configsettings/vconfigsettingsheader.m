#import "vconfigsettingsheader.h"

@implementation vconfigsettingsheader

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setUserInteractionEnabled:NO];
    [self setBackgroundColor:[UIColor whiteColor]];
    
    UIImageView *icon = [[UIImageView alloc] init];
    [icon setImage:[UIImage imageNamed:@"logo"]];
    [icon setClipsToBounds:YES];
    [icon setContentMode:UIViewContentModeScaleAspectFit];
    [icon setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    UILabel *title = [[UILabel alloc] init];
    [title setBackgroundColor:[UIColor clearColor]];
    [title setFont:[UIFont fontWithName:fontboldname size:22]];
    [title setTextColor:colormain];
    [title setTextAlignment:NSTextAlignmentCenter];
    [title setText:NSLocalizedString(@"config_settings_header_title", nil)];
    [title setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    UILabel *version = [[UILabel alloc] init];
    [version setBackgroundColor:[UIColor clearColor]];
    [version setFont:[UIFont fontWithName:fontname size:14]];
    [version setTextColor:[UIColor colorWithWhite:0 alpha:0.4]];
    [version setTextAlignment:NSTextAlignmentCenter];
    [version setText:[NSString stringWithFormat:NSLocalizedString(@"config_settings_header_version", nil), [[[NSBundle mainBundle] infoDictionary] valueForKey:(NSString*)kCFBundleVersionKey]]];
    [version setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    UIView *border = [[UIView alloc] init];
    [border setBackgroundColor:colormain];
    [border setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self addSubview:border];
    [self addSubview:version];
    [self addSubview:title];
    [self addSubview:icon];
    
    NSDictionary *views = @{@"icon":icon, @"border":border, @"title":title, @"version":version};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[icon]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[title]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[version]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[border]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-50-[icon(60)]-10-[title]-(-6)-[version]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[border(1)]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

@end