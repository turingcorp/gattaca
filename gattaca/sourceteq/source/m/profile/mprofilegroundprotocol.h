#import <UIKit/UIKit.h>

@protocol mprofilegroundprotocol <NSObject>

-(instancetype)init:(NSInteger)amount;
-(profile_ground)type;
-(NSInteger)amount;
-(UIColor*)color;
-(void)updateamount:(NSInteger)newamount;

@end