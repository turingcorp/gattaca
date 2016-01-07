#import "appdel.h"

@interface cmain:UIPageViewController

+(instancetype)singleton;
-(void)changesection:(appsection)section;

@property(nonatomic)appsection section;

@end