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
    [strongtitle setFont:[UIFont fontWithName:fontname size:16]];
    [strongtitle setTextColor:[UIColor colorWithWhite:0.4 alpha:1]];
    [strongtitle setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.title = strongtitle;
    
    UISwitch *strongsw = [[UISwitch alloc] init];
    [strongsw setOnTintColor:colormain];
    [strongsw setTintColor:[UIColor colorWithWhite:0.9 alpha:1]];
    [strongsw setTranslatesAutoresizingMaskIntoConstraints:NO];
    [strongsw addTarget:self action:@selector(actionswitch:) forControlEvents:UIControlEventValueChanged];
    self.sw = strongsw;
    
    [self addSubview:strongtitle];
    [self addSubview:strongsw];
    
    NSDictionary *views = @{@"title":strongtitle, @"sw":strongsw};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[title]-150-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[sw]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[title]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-15-[sw]" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark actions

-(void)actionswitch:(UISwitch*)sw
{
    [self.item change:sw.isOn];
}

#pragma mark -
#pragma mark cel protocol

-(void)config:(id<mconfigsettingsprotocol>)item
{
    self.item = item;
    
    [self.title setText:[item title]];
    [self.sw setOn:[item value] animated:NO];
}

@end