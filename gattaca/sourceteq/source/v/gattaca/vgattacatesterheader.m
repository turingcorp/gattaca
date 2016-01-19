#import "vgattacatesterheader.h"

@implementation vgattacatesterheader

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    
    return self;
}

#pragma mark public

-(void)config:(NSString*)title
{
    [self.lbl setText:title]
}

@end