#import "mmyprofileage.h"

@implementation mmyprofileage

-(instancetype)init:(NSInteger)age
{
    self = [super init];
    
    self.value = age;
    
    return self;
}

@end