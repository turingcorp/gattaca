#import "mgattacateststep.h"

@implementation mgattacateststep
{
    NSMutableArray *array;
}

+(instancetype)parse:(NSDictionary*)dictionary
{
    mgattacateststep *step = [[mgattacateststep alloc] init];
    step.steptype = (test_step)[dictionary[@"type"] integerValue];
    
    NSArray *rawitems = dictionary[@"items"];
    NSInteger count = rawitems.count;
    
    for(NSInteger i = 0; i < count; i++)
    {
        NSString *itemurl = rawitems[i];
        [step add:[[mgattacateststepitem alloc] init:itemurl index:i]];
    }
    
    return step;
}

-(instancetype)init
{
    self = [super init];
    
    array = [NSMutableArray array];
    
    return self;
}

#pragma mark functionality

-(void)add:(mgattacateststepitem*)item
{
    [array addObject:item];
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