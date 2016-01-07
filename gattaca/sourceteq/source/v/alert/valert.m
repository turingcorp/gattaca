#import "valert.h"

@implementation valert

-(instancetype)init
{
    self = [super init];
    
    if(applicationios == ioslevel7)
    {
        [self setBackgroundColor:[UIColor colorWithWhite:1 alpha:0.95]];
    }
    else
    {
        UIVisualEffectView *blur = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight]];
        [blur setUserInteractionEnabled:NO];
        
        [self addSubview:blur];
    }
    
    return self;
}

@end