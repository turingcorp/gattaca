#import "appdel.h"

@class mprofile;
@class mmyprofilename;

@interface mmyprofile:NSObject

+(instancetype)singleton;
-(void)loaduser;
-(void)updatename:(NSString*)newname;
-(void)changenameto:(mmyprofilename*)name;
-(void)updategender:(profile_gender)newgender;
-(void)updateage:(NSInteger)newage;

@property(strong, nonatomic)mprofile *profile;
@property(nonatomic)profile_name nametype;
@property(nonatomic)BOOL coordsactive;

@end