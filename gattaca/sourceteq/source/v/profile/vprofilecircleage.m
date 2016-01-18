#import "vprofilecircleage.h"

@implementation vprofilecircleage

-(instancetype)init:(vprofilecircle*)circle
{
    self = [super init];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    self.circle = circle;
    
    return self;
}

@end