#import "mmyprofileage.h"

@implementation mmyprofileage

-(instancetype)init:(NSInteger)age
{
    self = [super init];
    
    self.value = age;
    self.valuestr = [NSString stringWithFormat:@"%@", @(age)];
    
    return self;
}

@end