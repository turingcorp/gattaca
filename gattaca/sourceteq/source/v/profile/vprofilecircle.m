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
    
    UILabel *lbl = [[UILabel alloc] init];
    [lbl setBackgroundColor:[UIColor clearColor]];
    [lbl setTextAlignment:NSTextAlignmentCenter];
    [lbl setTextColor:[UIColor colorWithWhite:0 alpha:0.8]];
    [lbl setFont:[UIFont fontWithName:fontname size:15]];
    [lbl setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self addSubview:lbl];
    [self addSubview:like];
    [self addSubview:ground];
    
    NSDictionary *views = @{@"like":like, @"ground":ground, @"lbl":lbl};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-40-[like]-40-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-40-[like]-40-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[ground]-50-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-50-[ground]-50-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[lbl]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-70-[lbl]-70-|" options:0 metrics:metrics views:views]];
    
    return self;
}

@end