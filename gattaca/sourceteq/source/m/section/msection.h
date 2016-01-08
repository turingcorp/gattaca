#import "appdel.h"
#import "msectionprotocol.h"

@class msectionconfig;
@class msectionbrowse;
@class msectioncontact;
@class msectionlogin;

@interface msection:NSObject

+(msectionconfig*)config;
+(msectionbrowse*)browse;
+(msectioncontact*)contact;
+(msectionlogin*)login;
+(instancetype)menu;
-(NSInteger)count;
-(id<msectionprotocol>)item:(NSInteger)item;

@end