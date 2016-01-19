#import "mgattacatest.h"

@implementation mgattacatest
{
    NSMutableArray *array;
}

+(instancetype)test
{
    NSMutableArray *rawsteps = [NSMutableArray arrayWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"" withExtension:@"plist"]];
}

-(instancetype)init
{
    self = [super init];
    
    array = [NSMutableArray array];
    
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

@end