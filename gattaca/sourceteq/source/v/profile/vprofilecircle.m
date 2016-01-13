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
    
    vprofilecircleribbon *ribbon = [[vprofilecircleribbon alloc] init];
    
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
    [self addSubview:like];
    [self addSubview:ground];
    
    NSDictionary *views = @{@"like":like, @"ground":ground, @"ribbon":ribbon};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[like]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[like]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[ground]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[ground]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[ribbon]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[ribbon]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

@end