#import "mlogin.h"

@implementation mlogin

+(instancetype)generate
{
    return [[self alloc] initWithObjects:
            [[mloginfirst alloc] init],
            [[mloginsecond alloc] init],
            [[mloginthird alloc] init],
            nil];
}

@end