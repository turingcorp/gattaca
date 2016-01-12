#import "appdel.h"

@interface vconfigsettingsswitch:UICollectionViewCell<vconfigsettingscelprotocol>

@property(weak, nonatomic)id<mconfigsettingsprotocol> item;
@property(weak, nonatomic)UILabel *title;
@property(weak, nonatomic)UISwitch *sw;

@end