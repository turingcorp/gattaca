#import <Foundation/Foundation.h>

@protocol mconfigsettingsprotocol <NSObject>

-(Class)celclass;
-(NSString*)celname;
-(NSString*)title;

@optional

-(BOOL)value;

@end