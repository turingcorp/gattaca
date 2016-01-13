#import <UIKit/UIKit.h>

@protocol mprofilelikeprotocol <NSObject>

-(instancetype)init:(NSInteger)amount;
-(profile_like)type;
-(NSInteger)amount;
-(UIColor*)color;

@end