#import "appdel.h"

@interface vconfigprofilecel:UICollectionViewCell

-(void)config:(id<mconfigprofileprotocol>)item;

@property(weak, nonatomic)UIImageView *icon;
@property(weak, nonatomic)UILabel *title;
@property(weak, nonatomic)UILabel *value;

@end