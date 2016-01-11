#import "vconfigprofile.h"

@implementation vconfigprofile

-(instancetype)init:(cconfigprofile*)controller
{
    self = [super init:controller];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    
    return self;
}

@end