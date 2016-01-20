#import "mgattacateststepitem.h"

@implementation mgattacateststepitem

-(instancetype)init:(mgattacateststep*)step item:(mprofilecircleitem*)item image:(NSString*)image
{
    self = [super init];
    
    self.step = step;
    self.item = item;
    self.image = image;
    
    return self;
}

#pragma mark public

-(void)selected
{
    self.item.counter++;
    [self.step.test next];
    
    [[analytics singleton] trackevent:ga_event_gattaca_test action:ga_action_selected label:self.item.trackname];
}

@end