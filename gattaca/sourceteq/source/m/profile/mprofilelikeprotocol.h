#import <UIKit/UIKit.h>

@protocol mprofilelikeprotocol <NSObject>

-(instancetype)init:(NSInteger)amount;
-(profile_like)type;
-(UIColor*)color;

@property(nonatomic)NSInteger amount;

@end