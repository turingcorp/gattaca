#import "vconfigsettingscel.h"

@implementation vconfigsettingscel

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    
    return self;
}

#pragma mark public

-(void)config:(id<mconfigsettingsprotocol>)item
{
    
}

@end