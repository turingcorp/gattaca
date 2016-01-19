#import "appdel.h"

@class mgattacateststeptitle;
@class mgattacateststepitem;

@interface mgattacateststep:NSObject

+(instancetype)parse:(NSDictionary*)dictionary;
-(NSInteger)count;
-(mgattacateststepitem*)item:(NSInteger)item;

@property(strong, nonatomic)mgattacateststeptitle *title;
@property(nonatomic)test_step steptype;

@end