#import "vprofilecircleribbon.h"

@implementation vprofilecircleribbon

-(instancetype)init:(vprofilecircle*)circle
{
    self = [super init];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    self.circle = circle;
    
    UIView *ribbon = [[UIView alloc] init];
    [ribbon setTranslatesAutoresizingMaskIntoConstraints:NO];
    [ribbon setBackgroundColor:[vprofile colorforgender:circle.profile.gender]];
    
    UILabel *lbl = [[UILabel alloc] init];
    [lbl setBackgroundColor:[UIColor clearColor]];
    [lbl setTextAlignment:NSTextAlignmentCenter];
    [lbl setTextColor:[UIColor whiteColor]];
    [lbl setFont:[UIFont fontWithName:fontboldname size:22]];
    [lbl setText:circle.profile.name];
    [lbl setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self addSubview:ribbon];
    [self addSubview:lbl];
    
    NSDictionary *views = @{@"lbl":lbl, @"ribbon":ribbon};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-70-[lbl]-70-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-160-[lbl]-160-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-60-[ribbon]-60-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-150-[ribbon]-150-|" options:0 metrics:metrics views:views]];
    
    return self;
}

@end