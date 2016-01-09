#import "appdel.h"

@class cconfigsettings;

@interface vconfigsettings:UIView

-(instancetype)init:(cconfigsettings*)controller;

@property(weak, nonatomic)cconfigsettings *controller;

@end