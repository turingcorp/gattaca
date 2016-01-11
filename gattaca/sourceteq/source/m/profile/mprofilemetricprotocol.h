#import <Foundation/Foundation.h>

@protocol mprofilemetricprotocol <NSObject>

-(instancetype)init:(double)amount;
-(profile_metric)type;
-(NSString*)name;
-(double)amount;

@end