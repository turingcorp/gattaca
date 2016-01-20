#import "appdel.h"

@class mgattacateststep;

@interface mgattacateststepitem:NSObject

-(instancetype)init:(mgattacateststep*)step circle:(id<mprofilecircleprotocol>)circle image:(NSString*)image;
-(void)selected;

@property(weak, nonatomic)id<mprofilecircleprotocol> circle;
@property(weak, nonatomic)mgattacateststep *step;
@property(copy, nonatomic)NSString *image;

@end