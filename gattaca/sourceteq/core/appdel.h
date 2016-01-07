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
#import <Google/Analytics.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import "analytics.h"
#import "timerbg.h"
#import "generic.h"
#import "private.h"
#import "m.h"
#import "v.h"
#import "c.h"

@interface appdel:UIResponder<UIApplicationDelegate>

@end