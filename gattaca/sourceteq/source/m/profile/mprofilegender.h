#import "appdel.h"

@interface mprofilegender:NSObject

+(instancetype)gender:(profile_gender)gender;
-(UIColor*)color;

@property(nonatomic)profile_gender type;

@end