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
#import <GLKit/GLKit.h>
#import <GameKit/GameKit.h>
#import <Google/Analytics.h>
#import "analytics.h"
#import "timerbg.h"
#import "mod.h"
#import "ctr.h"
#import "generic.h"
#import "vi.h"
#import "gx.h"
#import "gk.h"

@interface appdel:UIResponder<UIApplicationDelegate>

@end