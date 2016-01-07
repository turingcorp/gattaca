#import "appdel.h"

@class msectionconfig;
@class msectionbrowse;
@class msectioncontact;

@interface msection:NSObject

+(msectionconfig*)config;
+(msectionbrowse*)browse;
+(msectioncontact*)contact;

@end