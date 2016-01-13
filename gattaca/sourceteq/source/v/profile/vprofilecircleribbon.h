#import "appdel.h"

@class vprofilecircle;

@interface vprofilecircleribbon:UIView

-(instancetype)init:(vprofilecircle*)circle;

@property(weak, nonatomic)vprofilecircle *circle;

@end