#import "vprofile.h"

@implementation vprofile

+(UIColor*)colorforgender:(profile_gender)gender
{
    UIColor *color;
    
    switch(gender)
    {
        case profile_gender_male:
            
            color = [UIColor colorWithRed:1 green:0.7 blue:0 alpha:1];
            
            break;
            
        case profile_gender_female:
            
            color = [UIColor colorWithRed:1 green:0.6 blue:0.9 alpha:1];
            
            break;
    }
    
    return color;
}

-(instancetype)init:(mprofile*)profile
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.profile = profile;
    
    vprofilecircle *circle = [[vprofilecircle alloc] init];
    [self addSubview:circle];
    
    vprofileqr *qr = [[vprofileqr alloc] init:profile];
    self.qr = qr;
    
    vprofilename *name = [[vprofilename alloc] init:profile];
    self.name = name;
    
    [self addSubview:qr];
    [self addSubview:name];
    
    NSDictionary *views = @{@"qr":qr, @"name":name, @"circle":circle};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[qr(40)]-5-[name]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[qr(40)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[name(40)]" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark public

-(void)reload
{
    [self.qr reload];
    [self.name reload];
}

@end