#import "vgattacatesterheader.h"

@implementation vgattacatesterheader

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setUserInteractionEnabled:NO];
    
    UILabel *lbl = [[UILabel alloc] init];
    [lbl setBackgroundColor:[UIColor clearColor]];
    [lbl setTextAlignment:NSTextAlignmentCenter];
    [lbl setFont:[UIFont fontWithName:fontname size:20]];
    [lbl setTextColor:[UIColor whiteColor]];
    [lbl setTranslatesAutoresizingMaskIntoConstraints:NO];
    [lbl setNumberOfLines:0];
    
    self.lbl = lbl;
    [self addSubview:lbl];
    
    NSDictionary *views = @{@"lbl":lbl};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[lbl]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[lbl]-40-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark public

-(void)config:(mgattacateststeptitle*)title
{
    [self.lbl setText:title.title];
}

@end