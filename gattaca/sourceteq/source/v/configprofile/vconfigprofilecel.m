#import "vconfigprofilecel.h"

@implementation vconfigprofilecel

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    
    UILabel *title = [[UILabel alloc] init];
    [title setBackgroundColor:[UIColor clearColor]];
    [title setFont:[UIFont fontWithName:fontname size:13]];
    [title setUserInteractionEnabled:NO];
    [title setTranslatesAutoresizingMaskIntoConstraints:NO];
    [title setTextColor:[UIColor colorWithWhite:0 alpha:0.8]];
    self.title = title;
    
    UILabel *value = [[UILabel alloc] init];
    [value setBackgroundColor:[UIColor clearColor]];
    [value setFont:[UIFont fontWithName:fontboldname size:17]];
    [value setUserInteractionEnabled:NO];
    [value setTextAlignment:NSTextAlignmentRight];
    [value setTranslatesAutoresizingMaskIntoConstraints:NO];
    [value setTextColor:[UIColor colorWithWhite:0 alpha:0.6]];
    self.value = value;
    
    [self addSubview:title];
    [self addSubview:value];
    
    NSDictionary *views = @{@"title":title, @"value":value};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[title]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[value]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[title]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[value]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark public

-(void)config:(id<mconfigprofileprotocol>)item
{
    [self.title setText:[item title]];
    [self.value setText:[item value]];
}

@end