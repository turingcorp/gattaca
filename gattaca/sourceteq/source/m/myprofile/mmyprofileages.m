#import "mmyprofileages.h"

@implementation mmyprofileages
{
    NSMutableArray *array;
}

-(instancetype)init
{
    self = [super init];
    
    return self;
}

#pragma mark public

-(NSInteger)count
{
    return array.count;
}

-(mmyprofileage*)item:(NSInteger)index;
{
    return array[index];
}

@end