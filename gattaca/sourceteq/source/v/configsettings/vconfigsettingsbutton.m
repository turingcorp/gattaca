#import "vconfigsettingsbutton.h"

@implementation vconfigsettingsbutton

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    
    UILabel *title = [[UILabel alloc] init];
    [title setBackgroundColor:[UIColor clearColor]];
    [title setUserInteractionEnabled:NO];
    [title setFont:[UIFont fontWithName:fontboldname size:15]];
    [title setTextAlignment:NSTextAlignmentCenter];
    [title setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.title = title;
    
    [self addSubview:title];
    
    NSDictionary *views = @{@"title":title};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[title]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[title]-0-|" options:0 metrics:metrics views:views]];
    
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

-(void)hover
{
    if(self.isSelected || self.isHighlighted)
    {
        [self.title setTextColor:[UIColor whiteColor]];
        [self setBackgroundColor:colormain];
    }
    else
    {
        [self.title setTextColor:[UIColor colorWithWhite:0.2 alpha:1]];
        [self setBackgroundColor:[UIColor whiteColor]];
    }
}

#pragma mark -
#pragma mark cel protocol

-(void)config:(id<mconfigsettingsprotocol>)item
{
    [self.title setText:[item title]];
    [self hover];
}
@end