#import "vprofilecircleage.h"

@implementation vprofilecircleage

-(instancetype)init:(vprofilecircle*)circle
{
    self = [super init];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    self.circle = circle;
    
    UILabel *lbl = [[UILabel alloc] init];
    [lbl setBackgroundColor:[UIColor clearColor]];
    [lbl setFont:[UIFont fontWithName:fontboldname size:20]];
    [lbl setTextAlignment:NSTextAlignmentCenter];
    [lbl setTextColor:[UIColor colorWithWhite:0 alpha:0.25]];
    [lbl setText:[NSString stringWithFormat:@"%@", @([mmyprofile singleton].profile.age)]];
    [lbl setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self addSubview:lbl];
    
    NSDictionary *views = @{@"lbl":lbl};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[lbl]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[lbl]-110-|" options:0 metrics:metrics views:views]];
    
    return self;
}

@end