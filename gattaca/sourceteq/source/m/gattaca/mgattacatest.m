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
    self.currentitem = -1;
    self.circle = [[mprofilecircle alloc] init];
    [self next];
    
    return self;
}

#pragma mark functionality

-(void)addstep:(mgattacateststep*)step
{
    [array addObject:step];
}

#pragma mark public

-(void)next
{
    self.currentitem++;
    self.hasnext = self.currentitem < [self count] - 1;
}

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

-(void)renderscore
{
}

@end