#import "appdel.h"

@class mprofilecircleitem;
@class mgattacateststep;

@interface mgattacateststepitem:NSObject

-(instancetype)init:(mgattacateststep*)step item:(mprofilecircleitem*)item image:(NSString*)image;
-(void)selected;

@property(weak, nonatomic)mprofilecircleitem *item;
@property(weak, nonatomic)mgattacateststep *step;
@property(copy, nonatomic)NSString *image;

@end