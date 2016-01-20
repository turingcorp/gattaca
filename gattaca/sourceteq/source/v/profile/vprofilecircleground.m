#import "vprofilecircleground.h"

@implementation vprofilecircleground

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
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-25-[slash]-25-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-25-[slash]-25-|" options:0 metrics:metrics views:views]];
}

-(CGFloat)amounttopoint:(NSInteger)amount
{
    return ((amount * .36) * M_PI) / 180.0;
}

-(void)render
{
    CGFloat linewidth = 20;
    NSInteger added = 125;
    mprofileground *ground = self.circle.profile.ground;
    NSInteger count = [ground count];
    
    for(NSInteger i = count - 1; i >= 0; i--)
    {
        id<mprofilegroundprotocol> item = [ground item:i];
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