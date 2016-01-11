#import <Foundation/Foundation.h>

// app

typedef NS_ENUM(NSInteger, appsection)
{
    appsectionlogin,
    appsectionconfig,
    appsectionbrowse,
    appsectioncontact
};

// analytics

typedef NS_ENUM(NSInteger, ga_screen)
{
    ga_screen_login,
    ga_screen_logout,
    ga_screen_delete
};

typedef NS_ENUM(NSInteger, ga_event)
{
    ga_event_login,
    ga_event_logout,
    ga_event_delete,
    ga_event_apprate,
    ga_event_configuration_notifications
};

typedef NS_ENUM(NSInteger, ga_action)
{
    ga_action_on,
    ga_action_off,
    ga_action_optin,
    ga_action_start,
    ga_action_cancelled,
    ga_action_error,
    ga_action_done
};