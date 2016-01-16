#import "vconfigprofilecel.h"

@implementation vconfigprofilecel

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    
    return self;
}

#pragma mark public

-(void)config:(id<mconfigprofileprotocol>)item
{
    
}

@end