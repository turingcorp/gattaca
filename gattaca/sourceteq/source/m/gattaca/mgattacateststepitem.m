#import "mgattacateststepitem.h"

@implementation mgattacateststepitem

-(instancetype)init:(mgattacateststep*)step circle:(id<mprofilecircleprotocol>)circle image:(NSString*)image
{
    self = [super init];
    
    self.step = step;
    self.circle = circle;
    self.image = image;
    
    return self;
}

#pragma mark public

-(void)selected
{
    self.circle;
    [self.step.test next];
    
    [[analytics singleton] trackevent:ga_event_gattaca_test action:ga_action_selected label:[self.circle trackname]];
}

@end