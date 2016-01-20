#import "appdel.h"

@class mmyprofilename;

@interface mmyprofilenames:NSObject

+(NSString*)validname:(NSString*)name;
+(NSString*)namefortype:(profile_name)nametype;
+(mmyprofilename*)namemodel:(profile_name)nametype;
+(mmyprofilename*)firstvalid;
-(NSInteger)count;
-(mmyprofilename*)name:(NSInteger)item;

@end