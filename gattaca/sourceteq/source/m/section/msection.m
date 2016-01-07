#import "msection.h"

@implementation msection

#pragma mark factory

+(msectionconfig*)config
{
    return [[msectionconfig alloc] init];
}

+(msectionbrowse*)browse
{
    return [[msectionbrowse alloc] init];
}

+(msectioncontact*)contact
{
    return [[msectioncontact alloc] init];
}

+(msectionlogin*)login
{
    return [[msectionlogin alloc] init];
}

@end