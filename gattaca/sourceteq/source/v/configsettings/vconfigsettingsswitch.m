#import "vconfigsettingsswitch.h"

@implementation vconfigsettingsswitch

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    
    UILabel *title = [[UILabel alloc] init];
    [title setBackgroundColor:[UIColor clearColor]];
    [title setUserInteractionEnabled:NO];
    [title setFont:[UIFont fontWithName:fontname size:16]];
    [title setTextColor:[UIColor colorWithWhite:0.4 alpha:1]];
    [title setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.title = title;
    
    UISwitch *sw = [[UISwitch alloc] init];
    [sw setOnTintColor:colormain];
    [sw setTintColor:[UIColor colorWithWhite:0.9 alpha:1]];
    [sw setTranslatesAutoresizingMaskIntoConstraints:NO];
    [sw addTarget:self action:@selector(actionswitch:) forControlEvents:UIControlEventValueChanged];
    self.sw = sw;
    
    [self addSubview:title];
    [self addSubview:sw];
    
    NSDictionary *views = @{@"title":title, @"sw":sw};
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