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
    
    vprofilecircleribbon *ribbon = [[vprofilecircleribbon alloc] init:self];
    self.ribbon = ribbon;
    
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