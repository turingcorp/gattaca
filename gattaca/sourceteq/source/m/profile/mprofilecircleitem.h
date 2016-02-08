#import "appdel.h"

@interface mprofilecircleitem:NSObject

-(instancetype)init:(NSInteger)amount;
-(UIColor*)color;

@property(copy, nonatomic)NSString *trackname;
@property(nonatomic)profile_circle type;
@property(nonatomic)NSInteger amount;
@property(nonatomic)NSInteger counter;

@end