#import "vconfigprofilecel.h"

@implementation vconfigprofilecel

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    
    UILabel *title = [[UILabel alloc] init];
    [title setBackgroundColor:[UIColor clearColor]];
    [title setFont:[UIFont fontWithName:fontname size:14]];
    [title setUserInteractionEnabled:NO];
    [title setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.title = title;
    
    UILabel *value = [[UILabel alloc] init];
    [value setBackgroundColor:[UIColor clearColor]];
    [value setFont:[UIFont fontWithName:fontboldname size:20]];
    [value setUserInteractionEnabled:NO];
    [value setTextAlignment:NSTextAlignmentRight];
    [value setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.value = value;
    
    UIImageView *icon = [[UIImageView alloc] init];
    [icon setClipsToBounds:YES];
    [icon setContentMode:UIViewContentModeScaleAspectFit];
    [icon setImage:[[UIImage imageNamed:@"next"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    [icon setUserInteractionEnabled:NO];
    [icon setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    self.icon = icon;
    
    [self addSubview:title];
    [self addSubview:value];
    [self addSubview:icon];
    
    NSDictionary *views = @{@"title":title, @"value":value, @"icon":icon};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-15-[title]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[value]-60-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-5-[title]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[value]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[icon(30)]-10-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[icon]-0-|" options:0 metrics:metrics views:views]];
    
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
        [self.title setTextColor:[UIColor whiteColor]];
        [self.value setTextColor:[UIColor whiteColor]];
        [self.icon setTintColor:[UIColor whiteColor]];
        [self setBackgroundColor:colormain];
    }
    else
    {
        [self.title setTextColor:[UIColor colorWithWhite:0 alpha:0.7]];
        [self.value setTextColor:[UIColor colorWithWhite:0 alpha:0.35]];
        [self.icon setTintColor:[UIColor colorWithWhite:0 alpha:0.35]];
        [self setBackgroundColor:[UIColor whiteColor]];
    }
}

#pragma mark public

-(void)config:(id<mconfigprofileprotocol>)item
{
    [self.title setText:[item title]];
    [self.value setText:[item value]];
    [self hover];
}

@end