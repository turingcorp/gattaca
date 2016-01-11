#import "vconfigsettingsswitch.h"

@implementation vconfigsettingsswitch

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    
    UILabel *strongtitle = [[UILabel alloc] init];
    [strongtitle setBackgroundColor:[UIColor clearColor]];
    [strongtitle setUserInteractionEnabled:NO];
    [strongtitle setFont:[UIFont fontWithName:fontname size:18]];
    [strongtitle setTextColor:[UIColor colorWithWhite:0 alpha:0.7]];
    [strongtitle setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.title = strongtitle;
    
    UISwitch *strongsw = [[UISwitch alloc] init];
    [strongsw setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.sw = strongsw;
    
    [self addSubview:strongtitle];
    [self addSubview:strongsw];
    
    NSDictionary *views = @{};
    NSDictionary *metrics = @{};
    
    return self;
}

#pragma mark -
#pragma mark cel protocol

-(void)config:(id<mconfigsettingsprotocol>)item
{
    
}

@end