#import "appdel.h"

@interface vconfigcel:UICollectionViewCell

-(void)config:(id<mconfigprotocol>)item;

@property(weak, nonatomic)id<mconfigprotocol> item;
@property(weak, nonatomic)UIView *color;
@property(weak, nonatomic)UIImageView *image;
@property(weak, nonatomic)UILabel *lbl;

@end