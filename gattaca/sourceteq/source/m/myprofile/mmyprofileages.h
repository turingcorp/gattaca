#import "appdel.h"

@class mmyprofileage;

@interface mmyprofileages:NSObject

-(NSInteger)count;
-(mmyprofileage*)item:(NSInteger)index;

@property(nonatomic)NSInteger current;

@end