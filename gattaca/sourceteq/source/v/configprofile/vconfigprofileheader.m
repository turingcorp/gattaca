#import "vconfigprofileheader.h"

@implementation vconfigprofileheader

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    
    vprofilecircle *circle = [[vprofilecircle alloc] init:[mmyprofile singleton].profile];
    
    UIButton *btn = [[UIButton alloc] init];
    
    [self addSubview:circle];
    [self addSubview:btn];
    
    NSDictionary *views = @{@"circle":circle};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[circle]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[circle]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

@end