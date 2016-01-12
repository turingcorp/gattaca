#import "appdel.h"

@interface msession:NSObject

+(instancetype)singleton;
-(void)updateprofile;

@property(copy, nonatomic)NSString *userid;

@end