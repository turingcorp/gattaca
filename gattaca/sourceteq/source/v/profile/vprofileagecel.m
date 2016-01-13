#import "vprofileagecel.h"

@implementation vprofileagecel

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    
    UILabel *stronglbl = [[UILabel alloc] init];
    [stronglbl setBackgroundColor:[UIColor clearColor]];
    [stronglbl setUserInteractionEnabled:NO];
    [stronglbl setTextAlignment:NSTextAlignmentCenter];
    [stronglbl setFont:[UIFont fontWithName:fontboldname size:20]];
    [stronglbl setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    self.lbl = stronglbl;
    [self addSubview:stronglbl];
    
    NSDictionary *views = @{@"lbl":stronglbl};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[lbl]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[lbl]-0-|" options:0 metrics:metrics views:views]];
    
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
        [self setBackgroundColor:colormain];
        [self.lbl setTextColor:[UIColor whiteColor]];
    }
    else
    {
        [self setBackgroundColor:[UIColor clearColor]];
        [self.lbl setTextColor:[UIColor colorWithWhite:0.8 alpha:1]];
    }
}

#pragma mark public

-(void)config:(mmyprofileage*)age
{
    [self.lbl setText:age.valuestr];
    [self hover];
}

@end