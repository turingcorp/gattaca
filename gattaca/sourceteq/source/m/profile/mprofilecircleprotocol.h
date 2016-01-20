#import <UIKit/UIKit.h>

@protocol mprofilecircleprotocol <NSObject>

-(instancetype)init:(NSInteger)amount;
-(profile_circle)type;
-(UIColor*)color;
-(NSString*)trackname;

@property(nonatomic)NSInteger amount;
@property(nonatomic)NSInteger counter;

@end