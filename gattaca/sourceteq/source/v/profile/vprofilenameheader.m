#import "vprofilenameheader.h"

@implementation vprofilenameheader

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    
    UILabel *lbl = [[UILabel alloc] init];
    [lbl setBackgroundColor:[UIColor clearColor]];
    [lbl setUserInteractionEnabled:NO];
    [lbl setFont:[UIFont fontWithName:fontname size:18]];
    [lbl setTextColor:[UIColor colorWithWhite:0 alpha:1]];
    [lbl setTextAlignment:NSTextAlignmentCenter];
    [lbl setText:NSLocalizedString(@"profile_name_title", nil)];
    [lbl setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self addSubview:lbl];
    
    NSDictionary *views = @{@"lbl":lbl};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[lbl]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[lbl]-20-|" options:0 metrics:metrics views:views]];
    
    return self;
}

@end