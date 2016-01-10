#import "vconfigsettingsswitch.h"

@implementation vconfigsettingsswitch

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    return self;
}

#pragma mark -
#pragma mark cel protocol

-(void)config:(id<mconfigsettingsprotocol>)item
{
    
}

@end