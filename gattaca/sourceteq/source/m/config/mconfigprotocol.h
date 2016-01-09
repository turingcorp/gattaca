#import <UIKit/UIKit.h>

@protocol mconfigprotocol <NSObject>

-(UIViewController*)controller;
-(NSString*)title;
-(NSString*)descr;
-(NSString*)image;
-(UIColor*)color;

@end