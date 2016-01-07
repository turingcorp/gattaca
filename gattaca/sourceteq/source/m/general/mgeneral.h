#import <Foundation/Foundation.h>

// analytics

typedef NS_ENUM(NSInteger, ga_screen)
{
    ga_screen_home
};

typedef NS_ENUM(NSInteger, ga_event)
{
    ga_event_apprate
};

typedef NS_ENUM(NSInteger, ga_action)
{
    ga_action_on,
    ga_action_off,
    ga_action_optin
};