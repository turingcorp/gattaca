#import "appdel.h"

@interface cmain:UIPageViewController

+(instancetype)singleton;
-(void)opensection:(id<msectionprotocol>)section animated:(BOOL)_animated;

@property(strong, nonatomic)id<msectionprotocol> section;

@end