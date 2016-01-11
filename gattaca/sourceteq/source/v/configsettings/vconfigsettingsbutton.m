#import "vconfigsettingsbutton.h"

@implementation vconfigsettingsbutton

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    
    UILabel *strongtitle = [[UILabel alloc] init];
    [strongtitle setBackgroundColor:[UIColor clearColor]];
    [strongtitle setUserInteractionEnabled:NO];
    [strongtitle setFont:[UIFont fontWithName:fontboldname size:15]];
    [strongtitle setTextColor:[UIColor colorWithWhite:0.2 alpha:1]];
    [strongtitle setTextAlignment:NSTextAlignmentCenter];
    [strongtitle setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.title = strongtitle;
    
    [self addSubview:strongtitle];
    
    NSDictionary *views = @{@"title":strongtitle};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[title]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[title]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark -
#pragma mark cel protocol

-(void)config:(id<mconfigsettingsprotocol>)item
{
    [self.title setText:[item title]];
}
@end