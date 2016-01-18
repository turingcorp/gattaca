#import "appdel.h"

@class mmyprofilename;

@interface mmyprofilenames:NSObject

+(NSString*)validname:(NSString*)name;
+(NSString*)namefortype:(profile_name)nametype;
+(NSString*)firstvalid;
-(NSInteger)count;
-(mmyprofilename*)name:(NSInteger)item;

@end