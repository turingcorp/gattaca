#import "vmenucel.h"

@implementation vmenucel

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setBackgroundColor:[UIColor clearColor]];
    
    UIImageView *strongimage = [[UIImageView alloc] init];
    
    self.image = strongimage;
    
    return self;
}

@end