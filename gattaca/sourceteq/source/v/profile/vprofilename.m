#import "vprofilename.h"

@implementation vprofilename

-(instancetype)init:(mprofile*)profile
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setUserInteractionEnabled:NO];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];

    self.profile = profile;
    UILabel *lbl = [[UILabel alloc] init];
    [lbl setBackgroundColor:[UIColor clearColor]];
    [lbl setUserInteractionEnabled:NO];
    [lbl setFont:[UIFont fontWithName:fontboldname size:18]];
    [lbl setTextColor:[UIColor colorWithWhite:0 alpha:0.8]];
    [lbl setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.lbl = lbl;
    
    UIView *border = [[UIView alloc] init];
    [border setUserInteractionEnabled:NO];
    [border setClipsToBounds:YES];
    [border setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.border = border;
    
    [self addSubview:lbl];
    [self addSubview:border];
    
    NSDictionary *views = @{@"border":border, @"lbl":lbl};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[border(4)]-5-[lbl]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[border]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[lbl]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark public

-(void)reload
{
    [self.lbl setText:@"Shisus"];
}

@end