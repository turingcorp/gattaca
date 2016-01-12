#import "msession.h"

@implementation msession

+(instancetype)singleton
{
    static msession *single;
    static dispatch_once_t once;
    dispatch_once(&once, ^(void) { single = [[self alloc] init]; });
    
    return single;
}

-(instancetype)init
{
    self = [super init];
    
    [FBSDKProfile enableUpdatesOnAccessTokenChange:YES];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notifiedprofilechange:) name:FBSDKProfileDidChangeNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notifiedtokenchanged:) name:FBSDKAccessTokenDidChangeNotification object:nil];
    
    if([FBSDKAccessToken currentAccessToken])
    {
        [self loaduser];
    }
    
    return self;
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark notified

-(void)notifiedprofilechange:(NSNotification*)notification
{
}

-(void)notifiedtokenchanged:(NSNotification*)notification
{
    [self loaduser];
}

#pragma mark functionality

-(void)loaduser
{
    self.userid = [FBSDKAccessToken currentAccessToken].userID;
    
    if(self.userid)
    {
        [[mmyprofile singleton] loaduser];
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:notmenuchanged object:nil];
}

#pragma mark public

-(void)updateprofile
{
    NSString *updatename;
    
    switch([mmyprofile singleton].nametype)
    {
        case profile_name_firstname:
            
            updatename = [FBSDKProfile currentProfile].firstName;
            
            break;
            
        case profile_name_middelname:
            
            updatename = [FBSDKProfile currentProfile].middleName;
            
            break;
            
        case profile_name_lastname:
            
            updatename = [FBSDKProfile currentProfile].lastName;
            
            break;
    }
    
    if(updatename && updatename.length > 1)
    {
        
    }
}

@end