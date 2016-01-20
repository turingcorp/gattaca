#import "mmyprofilename.h"

@implementation mmyprofilename

-(instancetype)init:(profile_name)type value:(NSString*)value
{
    self = [super init];
    
    self.type = type;
    self.value = value;
    
    return self;
}

@end