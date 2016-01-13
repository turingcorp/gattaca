#import "vprofilecircleslash.h"

@implementation vprofilecircleslash

-(instancetype)init:(CGFloat)linewidth start:(CGFloat)start end:(CGFloat)end;
{
    self = [super init];
 
    [self setBackgroundColor:[UIColor clearColor]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    self.linewidth = linewidth;
    self.linewidth_2 = linewidth / 2.0;
    self.start = start;
    self.end = end;
    
    return self;
}

-(void)drawRect:(CGRect)rect
{
    CGFloat width_2 = rect.size.width / 2.0;
    CGFloat height_2 = rect.size.height / 2.0;
    CGFloat radius = width_2 - self.linewidth_2;
    CGPoint pointstart;
    CGPoint pointend;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, self.linewidth);
    CGContextSetStrokeColorWithColor(context, self.tintColor.CGColor);
    CGContextSetFillColorWithColor(context, self.tintColor.CGColor);
    CGContextAddArc(context, width_2, height_2, radius, self.start, self.start, 0);
    pointstart = CGContextGetPathCurrentPoint(context);
    CGContextAddArc(context, width_2, height_2, radius, self.start, self.end, 0);
    pointend = CGContextGetPathCurrentPoint(context);
    CGContextDrawPath(context, kCGPathStroke);
    CGRect rectstart = [self rectwithpoint:pointstart];
    CGRect rectend = [self rectwithpoint:pointend];
    CGContextAddEllipseInRect(context, rectstart);
    CGContextAddEllipseInRect(context, rectend);
    CGContextDrawPath(context, kCGPathFill);
}

#pragma mark functionality

-(CGRect)rectwithpoint:(CGPoint)point
{
    return CGRectMake(point.x - self.linewidth_2, point.y - self.linewidth_2, self.linewidth, self.linewidth);
}

@end