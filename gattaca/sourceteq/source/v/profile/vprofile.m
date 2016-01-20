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
    self.profile = profile;
    
    vprofilecircle *circle = [[vprofilecircle alloc] init];
    [self addSubview:circle];
    
    UIImageView *imageqrcode = [[UIImageView alloc] init];
    [imageqrcode setClipsToBounds:YES];
    [imageqrcode setContentMode:UIViewContentModeScaleAspectFit];
    [imageqrcode setUserInteractionEnabled:NO];
    [imageqrcode setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.imageqrcode = imageqrcode;
    
    [self addSubview:imageqrcode];
    
    NSDictionary *views = @{@"qrcode":imageqrcode,@"circle":circle};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[qrcode(30)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[qrcode(30)]" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark public

-(void)reload
{
    [self.imageqrcode setImage:[tools qrcode:@"hello world"]];
}

@end