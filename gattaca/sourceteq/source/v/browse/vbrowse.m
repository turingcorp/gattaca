#import "vbrowse.h"

@implementation vbrowse

-(instancetype)init:(cbrowse*)controller
{
    self = [super init:controller];
    [self setBackgroundColor:[UIColor whiteColor]];
    
    vspinner *strongspinner = [[vspinner alloc] init];
    self.spinner = strongspinner;
    
    [self addSubview:strongspinner];
    
    NSDictionary *metrics = @{};
    NSDictionary *views = @{@"spinner":strongspinner};
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[spinner]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[spinner]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

@end