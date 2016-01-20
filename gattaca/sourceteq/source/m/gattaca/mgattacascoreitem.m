#import "mgattacascoreitem.h"

@implementation mgattacascoreitem

-(instancetype)init:(test_step)type index:(NSInteger)index
{
    self = [super init];
    
    self.type = type;
    self.index = index;
    self.counter = 0;
    
    return self;
}

#pragma mark public

-(void)add
{
    self.counter++;
}

-(void)computefor:(NSInteger)total
{
    NSInteger multiplier = 1000;
    NSInteger computed = (self.counter / (CGFloat)total) * multiplier;
    
    switch(self.type)
    {
        case test_step_like:
     
            [[mmyprofile singleton].profile.like updatetype:(profile_like)self.index amount:computed];
            
            break;
            
        case test_step_ground:
            
            [[mmyprofile singleton].profile.ground updatetype:(profile_ground)self.index amount:computed];
            
            break;
    }
}

@end