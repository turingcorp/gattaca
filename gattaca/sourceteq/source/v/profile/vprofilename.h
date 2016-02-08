#import "appdel.h"

@class mprofile;

@interface vprofilename:UIView

-(instancetype)init:(mprofile*)profile;
-(void)reload;

@property(weak, nonatomic)mprofile *profile;
@property(weak, nonatomic)UIView *border;
@property(weak, nonatomic)UILabel *lbl;

@end