#import "appdel.h"

@class mconfigsettings;

@interface cconfigsettings:UIViewController

-(instancetype)init:(mconfigsettings*)model;

@property(weak, nonatomic)mconfigsettings *model;

@end