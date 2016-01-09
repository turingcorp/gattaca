#import "appdel.h"

@interface vlogincel:UICollectionViewCell

-(void)config:(id<mloginprotocol>)step;

@property(weak, nonatomic)UILabel *title;
@property(weak, nonatomic)UIImageView *image;

@end