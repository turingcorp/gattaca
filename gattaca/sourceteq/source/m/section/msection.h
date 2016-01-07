#import "appdel.h"

@class msectionconfig;
@class msectionbrowse;
@class msectioncontact;
@class msectionlogin;

@interface msection:NSObject

+(msectionconfig*)config;
+(msectionbrowse*)browse;
+(msectioncontact*)contact;
+(msectionlogin*)login;

@end