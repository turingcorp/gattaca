#import "mgattacateststep.h"

@implementation mgattacateststep
{
    NSMutableArray *array;
}

+(instancetype)parse:(NSDictionary*)dictionary test:(mgattacatest*)test
{
    mgattacateststep *step = [[mgattacateststep alloc] init:test];
    step.steptype = (test_step)[dictionary[@"type"] integerValue];
    step.title = [[mgattacateststeptitle alloc] init:step.steptype];
    
    NSArray *rawitems = dictionary[@"items"];
    NSInteger count = rawitems.count;
    
    for(NSInteger i = 0; i < count; i++)
    {
        NSString *itemurl = rawitems[i];
        mgattacateststepitem *item = [[mgattacateststepitem alloc] init:step url:itemurl index:i];
        
        if(arc4random_uniform(2))
        {
            [step add:item];
        }
        else
        {
            [step insert:item];
        }
    }
    
    return step;
}

-(instancetype)init:(mgattacatest*)test
{
    self = [super init];
    
    self.test = test;
    array = [NSMutableArray array];
    
    return self;
}

#pragma mark functionality

-(void)add:(mgattacateststepitem*)item
{
    [array addObject:item];
}

-(void)insert:(mgattacateststepitem*)item
{
    [array insertObject:item atIndex:0];
}

#pragma mark public

-(NSInteger)count
{
    return array.count;
}

-(mgattacateststepitem*)item:(NSInteger)item;
{
    return array[item];
}

@end