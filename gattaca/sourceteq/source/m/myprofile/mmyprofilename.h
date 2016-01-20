#import "appdel.h"

@interface mmyprofilename:NSObject

-(instancetype)init:(profile_name)type value:(NSString*)value;

@property(copy, nonatomic)NSString *value;
@property(nonatomic)profile_name type;

@end