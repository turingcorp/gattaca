#import "vconfigprofilecel.h"

@implementation vconfigprofilecel

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    
    UILabel *title = [[UILabel alloc] init];
    
    UILabel *value = [[UILabel alloc] init];
    
    
    [self addSubview:title];
    [self addSubview:value];
    
    return self;
}

#pragma mark public

-(void)config:(id<mconfigprofileprotocol>)item
{
    [self.title setText:[item title]];
    [self.value setText:[item value]];
}

@end