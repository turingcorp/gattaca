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
    
    [self addSubview:like];
    [self addSubview:ground];
    
    NSDictionary *views = @{@"like":like, @"ground":ground};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-40-[like]-40-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-40-[like]-40-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[ground]-50-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-50-[ground]-50-|" options:0 metrics:metrics views:views]];
    
    return self;
}

@end