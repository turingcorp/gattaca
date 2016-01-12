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
    [stronglbl setFont:[UIFont fontWithName:fontboldname size:22]];
    [stronglbl setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    self.lbl = stronglbl;
    [self addSubview:stronglbl];
    
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
        
    }
    else
    {
        
    }
}

#pragma mark public

-(void)config:(mmyprofileage*)age
{
    [self hover];
}

@end