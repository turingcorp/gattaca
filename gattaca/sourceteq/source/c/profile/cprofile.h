#import "appdel.h"

@class mconfigprofile;

@interface cprofile:UIViewController

-(instancetype)init:(mconfigprofile*)model;

@property(weak, nonatomic)mconfigprofile *model;

@end