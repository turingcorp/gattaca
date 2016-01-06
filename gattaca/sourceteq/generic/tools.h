#import "appdel.h"

@interface tools:NSObject

+(instancetype)sha;
+(void)rateapp;
+(NSDictionary*)defaultdict;
+(NSInteger)timestamp;
+(GLKVector4)colorfor:(beadcolor)_color;
+(NSString*)imageforoperation:(beadop)_op;
+(UIColor*)colorwithvector:(GLKVector4)_vector;;
-(NSString*)urlencode:(NSString*)_string;
-(NSString*)numbertostring:(NSNumber*)_number;

@end