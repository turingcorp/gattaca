#import "appdel.h"

@class mgattacateststep;

@interface mgattacateststepitem:NSObject

-(instancetype)init:(mgattacateststep*)step url:(NSString*)url index:(NSInteger)index;

@property(weak, nonatomic)mgattacateststep *step;
@property(copy, nonatomic)NSString *url;
@property(nonatomic)NSInteger index;

@end