#import "appdel.h"

@class vprofilecircle;

@interface vprofilecircleground:UIView

-(instancetype)init:(vprofilecircle*)circle;

@property(weak, nonatomic)vprofilecircle *circle;

@end