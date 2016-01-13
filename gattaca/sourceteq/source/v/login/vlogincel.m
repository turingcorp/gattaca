#import "vlogincel.h"

@implementation vlogincel

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setUserInteractionEnabled:NO];

    UILabel *title = [[UILabel alloc] init];
    [title setBackgroundColor:[UIColor clearColor]];
    [title setFont:[UIFont fontWithName:fontname size:22]];
    [title setTextColor:[UIColor colorWithWhite:0 alpha:0.7]];
    [title setTextAlignment:NSTextAlignmentCenter];
    [title setTranslatesAutoresizingMaskIntoConstraints:NO];
    [title setNumberOfLines:0];
    self.title = title;
    
    [self addSubview:title];
    
    NSDictionary *metrics = @{};
    NSDictionary *views = @{@"title":title};
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[title]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-50-[title]" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark public

-(void)config:(id<mloginprotocol>)step
{
    [self.title setText:[step title]];
}

@end