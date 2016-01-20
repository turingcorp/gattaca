#import "vconfigprofileheader.h"

@implementation vconfigprofileheader

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    
    return self;
}

#pragma mark public

-(void)addcircle
{
    /*
    [self.circle removeFromSuperview];
    
    vprofilecircle *circle = [[vprofilecircle alloc] init:[mmyprofile singleton].profile];
    self.circle = circle;
    [self addSubview:circle];
    
    NSDictionary *views = @{@"circle":circle};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[circle(120)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[circle(120)]" options:0 metrics:metrics views:views]];*/
    
    UIImageView *image = [[UIImageView alloc] init];
    [image setClipsToBounds:YES];
    [image setContentMode:UIViewContentModeCenter];
    [image setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self addSubview:image];
    
    NSDictionary *views = @{@"image":image};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[image]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[image]-0-|" options:0 metrics:metrics views:views]];
    
    UIImage *qrcode = [tools qrcode:@"shisus chris"];
    [image setImage:qrcode];
    
}

@end