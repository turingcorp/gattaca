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
    
    NSDictionary *views = @{@"image":strongimage};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[image]-10-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-12-[image]-10-|" options:0 metrics:metrics views:views]];
    
    return self;
}

-(void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    [self hover];
}

-(void)setHighlighted:(BOOL)highlighted
{
    [super setHighlighted:highlighted];
    [self hover];
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
        [self.image setTintColor:[UIColor colorWithWhite:0 alpha:0.15]];
    }
}

#pragma mark public

-(void)config:(id<msectionprotocol>)item
{
    [self.image setImage:[[UIImage imageNamed:[item image]] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    [self setSelected:[item current]];
}

@end