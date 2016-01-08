#import "vmenucel.h"

@implementation vmenucel

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setBackgroundColor:[UIColor clearColor]];
    
    UIImageView *strongimage = [[UIImageView alloc] init];
    [strongimage setUserInteractionEnabled:NO];
    [strongimage setClipsToBounds:YES];
    [strongimage setContentMode:UIViewContentModeScaleAspectFit];
    [strongimage setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    self.image = strongimage;
    [self addSubview:strongimage];
    
    NSDictionary *views = @{};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[image]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[image]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark functionality

-(void)hover
{
    if(self.isSelected || self.isHighlighted)
    {
        [self.image setTintColor:colormain];
    }
    else
    {
        [self.image setTintColor:[UIColor colorWithWhite:0 alpha:0.2]];
    }
}

#pragma mark public

-(void)config:(id<msectionprotocol>)item
{
    [self.image setImage:[[UIImage imageNamed:[item image]] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
}

@end