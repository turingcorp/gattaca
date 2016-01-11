#import "vprofile.h"

@implementation vprofile

-(instancetype)init
{
    self = [super init];
    
    vprofilecircle *circle = [[vprofilecircle alloc] init];
    
    [self addSubview:circle];
    
    return self;
}

@end