#import "vprofilecircleslash.h"

@implementation vprofilecircleslash

-(instancetype)init
{
    self = [super init];
 
    [self setBackgroundColor:[UIColor clearColor]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    return self;
}

-(void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, self.linewidth);
    CGContextSetStrokeColorWithColor(context, self.tintColor.CGColor);
    CGContextAddArc(context, rect.size.width / 2, rect.size.height / 2, self.radius, self.startpoint, self.endpoint, 0);
    CGContextDrawPath(context, kCGPathStroke);
}

@end