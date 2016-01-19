#import "mgattacateststeptitle.h"

@implementation mgattacateststeptitle

-(instancetype)init:(test_step)type
{
    self = [super init];
    
    switch(type)
    {
        case test_step_like:
            
            self.title = NSLocalizedString(@"gattaca_tester_title_like", nil);
            
            break;
            
        case test_step_ground:
            
            self.title = NSLocalizedString(@"gattaca_tester_title_ground", nil);
            
            break;
    }
    
    return self;
}

@end