#import "appdel.h"

@interface cmain:UIPageViewController

+(instancetype)singleton;

@property(strong, nonatomic)id<msectionprotocol> section;

@end