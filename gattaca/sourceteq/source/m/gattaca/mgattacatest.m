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
    switch(item.step.steptype)
    {
        case test_step_like:
            
            [self.like addto:item.index];
            
            break;
            
        case test_step_ground:
            
            [self.ground addto:item.index];
            
            break;
    }
}

@end