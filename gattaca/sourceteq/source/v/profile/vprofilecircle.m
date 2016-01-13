#import "vprofilecircle.h"

@implementation vprofilecircle

-(instancetype)init:(mprofile*)profile
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setUserInteractionEnabled:NO];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];

    self.profile = profile;
    
    vprofilecirclelike *like = [[vprofilecirclelike alloc] init:self];
    self.like = like;
    
    vprofilecircleground *ground = [[vprofilecircleground alloc] init:self];
    self.ground = ground;
    
    UIView *ribbon = [[UIView alloc] init];
    [ribbon setTranslatesAutoresizingMaskIntoConstraints:NO];
    [ribbon setBackgroundColor:[vprofile colorforgender:profile.gender]];
    
    UILabel *lbl = [[UILabel alloc] init];
    [lbl setBackgroundColor:[UIColor clearColor]];
    [lbl setTextAlignment:NSTextAlignmentCenter];
    [lbl setTextColor:[UIColor whiteColor]];
    [lbl setFont:[UIFont fontWithName:fontboldname size:20]];
    [lbl setText:profile.name];
    [lbl setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self addSubview:ribbon];
    [self addSubview:lbl];
    [self addSubview:like];
    [self addSubview:ground];
    
    NSDictionary *views = @{@"like":like, @"ground":ground, @"lbl":lbl, @"ribbon":ribbon};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-40-[like]-40-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-40-[like]-40-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[ground]-50-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-50-[ground]-50-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[lbl]-50-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-70-[lbl]-70-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[ribbon]-50-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-120-[ribbon]-120-|" options:0 metrics:metrics views:views]];
    
    return self;
}

@end