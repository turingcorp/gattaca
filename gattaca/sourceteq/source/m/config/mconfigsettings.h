#import "appdel.h"
#import "mconfigsettingsprotocol.h"

@interface mconfigsettings:NSObject<mconfigprotocol>

-(void)registercels:(UICollectionView*)collection;

@end