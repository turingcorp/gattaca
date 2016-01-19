#import "vgattacatesterheader.h"

@implementation vgattacatesterheader

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    
    UILabel *lbl = [[UILabel alloc] init];
    [lbl setBackgroundColor:[UIColor clearColor]];
    [lbl setUserInteractionEnabled:NO];
    [lbl setTextAlignment:NSTextAlignmentCenter];
    [lbl setFont:[UIFont fontWithName:fontname size:18]];
    [lbl setTextColor:[UIColor whiteColor]];
    [lbl setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    self.lbl = lbl;
    [self addSubview:lbl];
    
    return self;
}

#pragma mark public

-(void)config:(mgattacateststeptitle*)title
{
    [self.lbl setText:title.title];
}

@end