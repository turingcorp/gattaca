#import "vbrowse.h"

@implementation vbrowse

-(instancetype)init:(UIViewController*)controller
{
    self = [super init:controller];
    [self setBackgroundColor:[UIColor whiteColor]];
    
    UIButton *buttonconfig = [[UIButton alloc] init];
    [buttonconfig setTitle:@"config" forState:UIControlStateNormal];
    [buttonconfig setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [buttonconfig setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    UIButton *buttoncontact = [[UIButton alloc] init];
    [buttoncontact setTitle:@"contact" forState:UIControlStateNormal];
    [buttoncontact setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [buttoncontact setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self addSubview:buttonconfig];
    [self addSubview:buttoncontact];
    
    NSDictionary *metrics = @{};
    NSDictionary *views = @{@"config":buttonconfig, @"contact":buttoncontact};
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[config][contact]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[config]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[contact]-20-|" options:0 metrics:metrics views:views]];
    
    return self;
}

@end