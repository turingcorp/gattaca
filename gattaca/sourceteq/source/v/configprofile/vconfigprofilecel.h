#import "appdel.h"

@interface vconfigprofilecel:UICollectionViewCell

-(void)config:(id<mconfigprofileprotocol>)item;

@property(weak, nonatomic)UILabel *lbl;

@end