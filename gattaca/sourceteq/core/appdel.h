#import <Foundation/Foundation.h>

typedef NS_ENUM (NSInteger, apptype)
{
    apptypephone,
    apptypepad
};

typedef NS_ENUM (NSInteger, ioslevel)
{
    ioslevel7,
    ioslevel8,
    ioslevel9
};

#import <UIKit/UIKit.h>
//#import <Google/Analytics.h>
#import "analytics.h"
#import "timerbg.h"
#import "generic.h"
#import "private.h"

@interface appdel:UIResponder<UIApplicationDelegate>

@end