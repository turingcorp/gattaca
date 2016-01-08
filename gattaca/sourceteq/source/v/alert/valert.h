#import "appdel.h"

@class calert;

@interface valert:UIView

-(instancetype)init:(calert*)controller;

@property(weak, nonatomic)calert *controller;

@end