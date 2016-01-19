#import "appdel.h"

@interface mgattacateststepitem:NSObject

-(instancetype)init:(NSString*)url index:(NSInteger)index;

@property(copy, nonatomic)NSString *url;
@property(nonatomic)NSInteger index;

@end