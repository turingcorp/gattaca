#import "appdel.h"
#import "mconfigsettingsprotocol.h"

@interface mconfigsettings:NSObject<mconfigprotocol>

-(NSInteger)count;
-(id<mconfigsettingsprotocol>)item:(NSInteger)item;
-(NSInteger)countclasses;
-(Class)classname:(NSInteger)item;
-(NSInteger*)identifier:(NSInteger)item;

@end