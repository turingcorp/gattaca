#import <UIKit/UIKit.h>

@protocol mprofilecircleprotocol <NSObject>

-(instancetype)init:(NSInteger)amount;
-(profile_circle)type;
-(UIColor*)color;
-(NSInteger)currentamount;
-(void)newamount:(NSInteger)newamount;

@end