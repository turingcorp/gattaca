#import "appdel.h"

@class vprofilecircle;

@interface vprofilecirclelike:UIView

-(instancetype)init:(vprofilecircle*)circle;

@property(weak, nonatomic)vprofilecircle *circle;

@end