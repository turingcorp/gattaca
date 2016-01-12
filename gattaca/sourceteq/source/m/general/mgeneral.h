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
    ga_screen_profile,
    ga_screen_contact
};

typedef NS_ENUM(NSInteger, ga_event)
{
    ga_event_login,
    ga_event_logout,
    ga_event_delete,
    ga_event_apprate,
    ga_event_config_noti,
    ga_event_facebook_profile
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

typedef NS_ENUM(NSInteger, profile_gender)
{
    profile_gender_male,
    profile_gender_female
};

typedef NS_ENUM(NSInteger, profile_name)
{
    profile_name_firstname,
    profile_name_middlename,
    profile_name_lastname
};

typedef NS_ENUM(NSInteger, profile_like)
{
    profile_like_science,
    profile_like_art,
    profile_like_sport,
    profile_like_social
};

typedef NS_ENUM(NSInteger, profile_ground)
{
    profile_ground_cultural,
    profile_ground_gaming,
    profile_ground_entertainment,
    profile_ground_partying
};