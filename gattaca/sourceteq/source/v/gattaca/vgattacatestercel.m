#import "vgattacatestercel.h"

@implementation vgattacatestercel

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    
    UIImageView *image = [[UIImageView alloc] init];
    [image setTranslatesAutoresizingMaskIntoConstraints:NO];
    [image setClipsToBounds:YES];
    [image setContentMode:UIViewContentModeCenter];
    [image setUserInteractionEnabled:NO];
    [image.layer setCornerRadius:60];
    
    self.image = image;
    
    CGFloat bgdia = 126;
    CGFloat border = (frame.size.width - bgdia) / 2;
    CGFloat margin = 3;
    CGFloat inborder = border + margin;
    
    UIView *bg = [[UIView alloc] init];
    [bg setClipsToBounds:YES];
    [bg.layer setCornerRadius:bgdia / 2.0];
    [bg setUserInteractionEnabled:NO];
    [bg setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.bg = bg;
    
    [self addSubview:bg];
    [self addSubview:image];
    
    NSDictionary *views = @{@"image":image, @"bg":bg};
    NSDictionary *metrics = @{@"border":@(border), @"inborder":@(inborder), @"margin":@(margin)};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(border)-[bg]-(border)-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[bg]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(inborder)-[image]-(inborder)-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(margin)-[image]-(margin)-|" options:0 metrics:metrics views:views]];
    
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
        [self.bg setBackgroundColor:[UIColor colorWithWhite:1 alpha:0.2]];
    }
    else
    {
        [self.bg setBackgroundColor:[UIColor clearColor]];
    }
}

#pragma mark public

-(void)config:(mgattacateststepitem*)item
{
    [self.image setImage:[UIImage imageNamed:item.url]];
}

@end