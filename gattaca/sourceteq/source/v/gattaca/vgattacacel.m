#import "vgattacacel.h"

@implementation vgattacacel

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];

    UILabel *lbl = [[UILabel alloc] init];
    [lbl setBackgroundColor:[UIColor clearColor]];
    [lbl setFont:[UIFont fontWithName:fontboldname size:18]];
    [lbl setUserInteractionEnabled:NO];
    [lbl setTranslatesAutoresizingMaskIntoConstraints:NO];
    [lbl setTextAlignment:NSTextAlignmentCenter];
    self.lbl = lbl;
    
    [self addSubview:lbl];
    
    NSDictionary *views = @{@"lbl":lbl};
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
        [self.lbl setTextColor:[UIColor whiteColor]];
        
        if(self.accept)
        {
            [self setBackgroundColor:colormain];
        }
        else
        {
            [self setBackgroundColor:[UIColor colorWithRed:1 green:0.1 blue:0 alpha:1]];
        }
    }
    else
    {
        [self.lbl setTextColor:[UIColor colorWithWhite:0 alpha:0.6]];
        [self setBackgroundColor:[UIColor colorWithWhite:1 alpha:0.2]];
    }
}

#pragma mark public

-(void)showaccept
{
    self.accept = YES;
    [self.lbl setText:NSLocalizedString(@"gattaca_main_accept", nil)];
    
    [self hover];
}

-(void)showcancel
{
    self.accept = NO;
    [self.lbl setText:NSLocalizedString(@"gattaca_main_cancel", nil)];
    
    [self hover];
}

@end