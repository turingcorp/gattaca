#import "mgattacatest.h"

@implementation mgattacatest
{
    NSMutableArray *array;
}

+(instancetype)test
{
    mgattacatest *test = [[mgattacatest alloc] init];
    NSMutableArray *rawsteps = [NSMutableArray arrayWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"test" withExtension:@"plist"]];
    NSInteger count = rawsteps.count;
    
    while(count)
    {
        NSInteger index = arc4random_uniform((CGFloat)count);
        NSDictionary *rawitem = rawsteps[index];
        [rawsteps removeObjectAtIndex:index];
        
        [test addstep:[mgattacateststep parse:rawitem test:test]];
        
        count = rawsteps.count;
    }
    
    return test;
}

-(instancetype)init
{
    self = [super init];
    
    array = [NSMutableArray array];
    self.currentitem = 0;
    self.like = [mgattacascore scorefor:test_step_like];
    self.ground = [mgattacascore scorefor:test_step_ground];
    
    return self;
}

#pragma mark functionality

-(void)addstep:(mgattacateststep*)step
{
    [array addObject:step];
}

#pragma mark public

-(NSInteger)count
{
    return array.count;
}

-(mgattacateststep*)step:(NSInteger)item
{
    return array[item];
}

-(mgattacateststep*)current
{
    return array[self.currentitem];
}

-(BOOL)next
{
    BOOL hasnext = NO;
    
    if(self.currentitem < [self count] - 1)
    {
        hasnext = YES;
        self.currentitem++;
    }
    
    return hasnext;
}

-(void)chooseitem:(mgattacateststepitem*)item
{
    NSInteger index = item.index;
    NSMutableString *str = [NSMutableString string];
    
    switch(item.step.steptype)
    {
        case test_step_like:
            
            [str appendString:@"like:"];
            [self.like addto:index];
            
            switch((profile_like)index)
            {
                case profile_like_science:
                    
                    [str appendString:@"science"];
                    
                    break;
                    
                case profile_like_art:
                    
                    [str appendString:@"art"];
                    
                    break;
                    
                case profile_like_social:
                    
                    [str appendString:@"social"];
                    
                    break;
                    
                case profile_like_sport:
                    
                    [str appendString:@"sport"];
                    
                    break;
            }
            
            break;
            
        case test_step_ground:
            
            [str appendString:@"ground:"];
            [self.ground addto:index];
            
            switch((profile_ground)index)
            {
                case profile_ground_cultural:
                    
                    [str appendString:@"cultural"];
                    
                    break;
                    
                case profile_ground_entertainment:
                    
                    [str appendString:@"entertainment"];
                    
                    break;
                    
                case profile_ground_gaming:
                    
                    [str appendString:@"gaming"];
                    
                    break;
                    
                case profile_ground_partying:
                    
                    [str appendString:@"partying"];
                    
                    break;
            }
            
            break;
    }
    
    [[analytics singleton] trackevent:ga_event_gattaca_test action:ga_action_selected label:str];
}

-(void)scoreall
{
    [self.like measure];
    [self.ground measure];
}

@end