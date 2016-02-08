#import "appdel.h"

@class mprofilecircleitem;

@interface mprofilecircle:NSObject

+(mprofilecircleitem*)circle:(profile_circle)type amount:(NSInteger)amount;
-(void)loadfromdb;
-(instancetype)init:(NSDictionary*)json;
-(mprofilecircleitem*)item:(profile_circle)type;

@end