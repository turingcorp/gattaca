#import "mmyprofilenames.h"

@implementation mmyprofilenames
{
    NSMutableArray *array;
}

-(instancetype)init
{
    self = [super init];
    
    array = [NSMutableArray array];
    
    
    
    return self;
}

#pragma mark functionality

-(void)add:(profile_name)type value:(NSString*)value
{
    [array addObject:[[mmyprofilename alloc] init:type value:value]];
}

#pragma mark public

-(NSInteger)count
{
    return array.count;
}

-(mmyprofilename*)name:(NSInteger)item
{
    return array[item];
}

@end