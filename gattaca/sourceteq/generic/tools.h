#import "appdel.h"

@interface tools:NSObject

+(instancetype)singleton;
+(void)rateapp;
+(NSDictionary*)defaultdict;
+(NSInteger)timestamp;
-(NSString*)urlencode:(NSString*)_string;

@end