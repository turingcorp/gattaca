#import <Foundation/Foundation.h>

@protocol mconfigsettingsprotocol <NSObject>

-(Class)celclass;
-(NSString*)celname;
-(NSString*)title;
-(void)change;

@optional

-(BOOL)value;

@end