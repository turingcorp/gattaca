#import "msection.h"

@implementation msection
{
    NSArray *array;
}

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

+(instancetype)menu
{
    return [[msection alloc] init];
}

-(instancetype)init
{
    self = [super init];
    
    array = [NSArray arrayWithObjects:
             [msection config],
             [msection browse],
             [msection contact],
             nil];

    return self;
}

#pragma mark public

-(NSInteger)count
{
    return array.count;
}

-(id<msectionprotocol>)item:(NSInteger)item
{
    return array[item];
}

@end