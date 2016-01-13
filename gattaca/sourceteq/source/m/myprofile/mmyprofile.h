#import "appdel.h"

@class mprofile;

@interface mmyprofile:NSObject

+(instancetype)singleton;
-(void)loaduser;
-(void)updatename:(NSString*)newname;
-(void)changenameto:(profile_name)nametype name:(NSString*)newname;
-(void)updategender:(profile_gender)newgender;
-(void)updateage:(NSInteger)newage;

@property(strong, nonatomic)mprofile *profile;
@property(nonatomic)BOOL coordsactive;

@end