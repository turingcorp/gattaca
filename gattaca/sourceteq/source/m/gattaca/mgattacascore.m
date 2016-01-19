#import "mgattacascore.h"

@implementation mgattacascore
{
    NSMutableDictionary *likes;
    NSMutableDictionary *grounds;
}

-(instancetype)init
{
    self = [super init];
    
    dictionary = [NSMutableDictionary dictionary];
    
    return self;
}

@end