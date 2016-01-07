#import "vloginindicatorcel.h"

@implementation vloginindicatorcel
{
    UIColor *fillcollor;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setBackgroundColor:[UIColor clearColor]];
    
    
    return self;
}

-(void)drawRect:(CGRect)rect
{
    
}

#pragma mark functionality

-(void)hover
{
    if(self.isSelected || self.isHighlighted)
    {
        fillcollor = [UIColor whiteColor];
    }
    else
    {
        fillcollor = [UIColor clearColor];
    }
    
    [self setNeedsDisplay];
}

@end