#import "appdel.h"

@interface tools:NSObject

+(instancetype)sha;
+(void)rateapp;
+(NSDictionary*)defaultdict;
+(NSInteger)timestamp;
-(NSString*)urlencode:(NSString*)_string;
-(NSString*)numbertostring:(NSNumber*)_number;

@end