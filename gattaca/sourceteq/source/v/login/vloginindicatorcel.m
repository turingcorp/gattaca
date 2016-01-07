#import "vloginindicatorcel.h"

@implementation vloginindicatorcel
{
    UIColor *fillcollor;
    CGRect circlerect;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setBackgroundColor:[UIColor clearColor]];
    [self hover];
    
    circlerect = CGRectMake(3, 3, frame.size.width - 6, frame.size.height - 6);
    
    return self;
}

-(void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    CGContextSetFillColorWithColor(context, fillcollor.CGColor);
    CGContextAddEllipseInRect(context, circlerect);
    CGContextDrawPath(context, kCGPathFillStroke);
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
        fillcollor = [UIColor blackColor];
    }
    else
    {
        fillcollor = [UIColor clearColor];
    }
    
    [self setNeedsDisplay];
}

@end