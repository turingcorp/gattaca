#import "appdel.h"

@interface tools:NSObject

+(instancetype)singleton;
+(void)rateapp;
+(NSDictionary*)defaultdict;
+(NSInteger)timestamp;
+(UIImage*)qrcode:(NSString*)string;
-(NSString*)urlencode:(NSString*)string;

@end