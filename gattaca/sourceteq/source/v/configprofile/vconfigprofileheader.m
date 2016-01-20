#import "vconfigprofileheader.h"

@implementation vconfigprofileheader

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
 
    vprofile *profile = [[vprofile alloc] init:[mmyprofile singleton].profile];
    self.profile = profile;
    
    [self addSubview:profile];
    
    NSDictionary *views = @{@"prof":profile};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[prof]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[prof]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark public

-(void)reload
{
    [self.profile reload];
}

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
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^
                   {
                       UIImage *qrcode = [tools qrcode:@"shisus chris"];
                       
                       dispatch_async(dispatch_get_main_queue(),
                                      ^
                                      {
                                          [image setImage:qrcode];
                                      });
                   });
}

@end