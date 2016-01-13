#import "vprofilecircleslash.h"

@implementation vprofilecircleslash

-(instancetype)init:(CGFloat)linewidth radius:(CGFloat)radius start:(CGFloat)start end:(CGFloat)end
{
    self = [super init];
 
    [self setBackgroundColor:[UIColor clearColor]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    self.linewidth = linewidth;
    self.linewidth_2 = linewidth / 2.0;
    self.radius = radius;
    self.start = start;
    self.end = end;
    
    return self;
}

-(void)drawRect:(CGRect)rect
{
    CGFloat width_2 = rect.size.width / 2.0;
    CGFloat height_2 = rect.size.height / 2.0;
    CGPoint pointstart;
    CGPoint pointend;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, self.linewidth);
    CGContextSetStrokeColorWithColor(context, self.tintColor.CGColor);
    CGContextSetFillColorWithColor(context, self.tintColor.CGColor);
    CGContextAddArc(context, width_2, height_2, self.radius, self.start, self.end, 0);
    pointend = CGContextGetPathCurrentPoint(context);
    CGContextDrawPath(context, kCGPathStroke);
    CGContextAddArc(context, width_2, height_2, self.radius, self.end, self.start, 0);
    pointstart = CGContextGetPathCurrentPoint(context);
    CGContextAddEllipseInRect(context, [self rectwithpoint:pointstart]);
    CGContextAddEllipseInRect(context, [self rectwithpoint:pointend]);
    CGContextDrawPath(context, kCGPathFill);
}

#pragma mark functionality

-(CGRect)rectwithpoint:(CGPoint)point
{
    return CGRectMake(point.x - self.linewidth_2, point.y - self.linewidth_2, point.x + self.linewidth_2, point.y + self.linewidth_2);
}

@end