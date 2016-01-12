#import "appdel.h"
#import "mconfigsettingsprotocol.h"

@interface mconfigsettings:NSObject<mconfigprotocol>

-(NSInteger)count;
-(id<mconfigsettingsprotocol>)item:(NSInteger)item;
-(void)registercels:(UICollectionView*)collection;

@end