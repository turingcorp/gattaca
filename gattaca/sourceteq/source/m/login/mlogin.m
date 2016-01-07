#import "mlogin.h"

@implementation mlogin

+(NSArray*)generate
{
    return [[NSArray alloc] initWithObjects:
            [[mloginfirst alloc] init],
            [[mloginsecond alloc] init],
            [[mloginthird alloc] init],
            nil];
}

@end