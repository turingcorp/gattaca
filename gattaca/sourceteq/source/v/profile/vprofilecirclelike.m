#import "vprofilecirclelike.h"

@implementation vprofilecirclelike

-(instancetype)init:(vprofilecircle*)circle
{
    self = [super init];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    self.circle = circle;
    [self render];
    
    return self;
}

#pragma mark functionality

-(void)constraintsfor:(vprofilecircleslash*)slash
{
    [self addSubview:slash];
    
    NSDictionary *views = @{@"slash":slash};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-40-[slash]-40-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-40-[slash]-40-|" options:0 metrics:metrics views:views]];
}

-(CGFloat)amounttopoint:(NSInteger)amount
{
    return ((amount * .36) * M_PI) / 180.0;
}

-(void)render
{
    CGFloat linewidth = 10;
    NSInteger added = 0;
    mprofilelike *like = self.circle.profile.like;
    NSInteger count = [like count];
    
    for(NSInteger i = count - 1; i >= 0; i--)
    {
        id<mprofilelikeprotocol> item = [like item:i];
        NSInteger amount = [item currentamount];
        
        if(amount)
        {
            CGFloat start = [self amounttopoint:added];
            added += amount;
            CGFloat end = [self amounttopoint:added];
            
            vprofilecircleslash *slash = [[vprofilecircleslash alloc] init:linewidth start:start end:end];
            slash.tintColor = [item color];
            [self constraintsfor:slash];
        }
    }
}

@end