#import "vconfigsettingsheader.h"

@implementation vconfigsettingsheader

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setUserInteractionEnabled:NO];
    [self setBackgroundColor:[UIColor whiteColor]];
    
    UIImageView *icon = [[UIImageView alloc] init];
    
    [self addSubview:icon];
    
    return self;
}

@end