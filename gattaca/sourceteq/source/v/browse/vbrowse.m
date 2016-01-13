#import "vbrowse.h"

@implementation vbrowse

-(instancetype)init:(cbrowse*)controller
{
    self = [super init:controller];
    [self setBackgroundColor:[UIColor whiteColor]];
    
    vspinner *spinner = [[vspinner alloc] init];
    self.spinner = spinner;
    
    [self addSubview:spinner];
    
    NSDictionary *metrics = @{};
    NSDictionary *views = @{@"spinner":spinner};
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[spinner]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[spinner]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

@end