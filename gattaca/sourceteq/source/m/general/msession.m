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

-(NSString*)namefortype:(profile_name)nametype
{
    NSString *name;
    
    switch(nametype)
    {
        case profile_name_firstname:
            
            name = [FBSDKProfile currentProfile].firstName;
            
            break;
            
        case profile_name_middlename:
            
            name = [FBSDKProfile currentProfile].middleName;
            
            break;
            
        case profile_name_lastname:
            
            name = [FBSDKProfile currentProfile].lastName;
            
            break;
    }
    
    return name;
}

-(BOOL)validname:(NSString*)name
{
    return name && name.length > 1;
}

#pragma mark public

-(void)updateprofile
{
    NSString *updatename = [self namefortype:[mmyprofile singleton].nametype];
    
    if(![self validname:updatename])
    {
        profile_name newtype;
        
        if([mmyprofile singleton].nametype == profile_name_firstname)
        {
            newtype = profile_name_lastname;
            updatename = [self namefortype:newtype];
            
            if(!updatename || updatename.length < 2)
                }
        else
    }
}

@end