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
    ga_screen_delete,
    ga_screen_browse,
    ga_screen_config,
    ga_screen_config_settings,
    ga_screen_config_profile,
    ga_screen_contact
};

typedef NS_ENUM(NSInteger, ga_event)
{
    ga_event_login,
    ga_event_logout,
    ga_event_delete,
    ga_event_apprate,
    ga_event_config_noti
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

// profile

typedef NS_ENUM(NSInteger, profile_metric)
{
    profile_metric_science,
    profile_metric_arts,
    profile_metric_sports,
    profile_metric_social
};