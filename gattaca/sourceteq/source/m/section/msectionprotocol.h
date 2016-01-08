#import <UIKit/UIKit.h>

@protocol msectionprotocol <NSObject>

-(appsection)section;
-(UIViewController*)controller;
-(NSString*)image;
-(BOOL)available;
-(BOOL)current;

@end