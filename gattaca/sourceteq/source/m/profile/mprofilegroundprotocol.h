#import <UIKit/UIKit.h>

@protocol mprofilegroundprotocol <NSObject>

-(instancetype)init:(NSInteger)amount;
-(profile_ground)type;
-(UIColor*)color;
-(NSInteger)currentamount;
-(void)newamount:(NSInteger)newamount;

@end