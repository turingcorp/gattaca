#import "vlogincel.h"

@implementation vlogincel

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setUserInteractionEnabled:NO];

    UILabel *strongtitle = [[UILabel alloc] init];
    [strongtitle setBackgroundColor:[UIColor clearColor]];
    [strongtitle setFont:[UIFont fontWithName:fontname size:22]];
    [strongtitle setTextColor:[UIColor colorWithWhite:0 alpha:0.7]];
    [strongtitle setTextAlignment:NSTextAlignmentCenter];
    [strongtitle setTranslatesAutoresizingMaskIntoConstraints:NO];
    [strongtitle setNumberOfLines:0];
    self.title = strongtitle;
    
    [self addSubview:strongtitle];
    
    NSDictionary *metrics = @{};
    NSDictionary *views = @{@"title":strongtitle};
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