#import "updater.h"

@implementation updater

NSString *documents;
NSInteger screenwidth;
NSInteger screenwidth_2;
NSInteger screenheight;
NSInteger screenheight_2;
CGRect screenrect;
CGFloat pixelsize2;
CGFloat pixelsize_2;
apptype applicationtype;
ioslevel applicationios;

+(void)launch
{
    [updater update];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^(void)
                   {
                       [[modsettings sha] loadpreferences];
                       [modarea sha];
                   });
}

#pragma mark private

+(void)update
{
    documents = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSDictionary *defaults = [tools defaultdict];
    NSUserDefaults *properties = [NSUserDefaults standardUserDefaults];
    NSInteger def_version = [defaults[@"version"] integerValue];
    NSInteger pro_version = [[properties valueForKey:@"version"] integerValue];
    
    if(def_version != pro_version)
    {
        [properties setValue:@(def_version) forKeyPath:@"version"];        
        
        if(pro_version < 10)
        {
            [updater firsttime:defaults];
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC), dispatch_get_main_queue(),
                           ^(void)
                           {
                               [[ctrmain sha] tutorial];
                           });
        }
    }
    
    [updater environment];
}

+(void)environment
{
    CGSize size = [UIScreen mainScreen].bounds.size;
    screenwidth = size.width;
    screenheight = size.height;
    
    switch([UIDevice currentDevice].userInterfaceIdiom)
    {
        case UIUserInterfaceIdiomPad:
            
            applicationtype = apptypepad;
            
            if(screenwidth < screenheight)
            {
                screenwidth = size.height;
                screenheight = size.width;
            }
            
            break;
        default:
            
            applicationtype = apptypephone;
            
            if(screenwidth > screenheight)
            {
                screenwidth = size.height;
                screenheight = size.width;
            }
            
            break;
    }
    
    NSInteger iosint = [UIDevice currentDevice].systemVersion.integerValue;
    
    if(iosint <= 7)
    {
        applicationios = ioslevel7;
    }
    else if(iosint <= 8)
    {
        applicationios = ioslevel8;
    }
    else
    {
        applicationios = ioslevel9;
    }
    
    screenwidth_2 = screenwidth / 2;
    screenheight_2 = screenheight / 2;
    screenrect = CGRectMake(0, 0, screenwidth, screenheight);
    pixelsize2 = pixelsize * 2;
    pixelsize_2 = pixelsize / 2;
}

+(void)firsttime:(NSDictionary*)_plist
{
    NSNumber *appid = _plist[@"appid"];
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    [dictionary setObject:@YES forKey:[NSString stringWithFormat:@"%@", @(settingbanners)]];
    [dictionary setObject:@YES forKey:[NSString stringWithFormat:@"%@", @(settingmasters)]];
    
    NSUserDefaults *userdef = [NSUserDefaults standardUserDefaults];
    
    [userdef removePersistentDomainForName:NSGlobalDomain];
    [userdef removePersistentDomainForName:NSArgumentDomain];
    [userdef removePersistentDomainForName:NSRegistrationDomain];
    [userdef setValue:appid forKey:@"appid"];
    [userdef setValue:[[NSUUID UUID] UUIDString] forKey:@"uuid"];
    [userdef setValue:dictionary forKey:@"settings"];
    [userdef synchronize];
}

@end