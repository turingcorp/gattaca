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
        [self updateprofile];
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

-(void)updateprofile
{
    NSString *updatename = [self namefortype:[mmyprofile singleton].nametype];
    
    if([self validname:updatename])
    {
        [[mmyprofile singleton] updatename:updatename];
    }
    else
    {
        profile_name newtype;
        
        switch([mmyprofile singleton].nametype)
        {
            case profile_name_firstname:
                
                newtype = profile_name_middlename;
                
                break;
                
            case profile_name_middlename:
                
                newtype = profile_name_lastname;
                
                break;
                
            case profile_name_lastname:
                
                newtype = profile_name_firstname;
                
                break;
        }
        
        updatename = [self namefortype:newtype];
        
        if(![self validname:updatename])
        {
            switch([mmyprofile singleton].nametype)
            {
                case profile_name_firstname:
                    
                    newtype = profile_name_lastname;
                    
                    break;
                    
                case profile_name_middlename:
                    
                    newtype = profile_name_firstname;
                    
                    break;
                    
                case profile_name_lastname:
                    
                    newtype = profile_name_middlename;
                    
                    break;
            }
            
            updatename = [self namefortype:newtype];
            
            if(![self validname:updatename])
            {
                newtype = profile_name_firstname;
                updatename = NSLocalizedString(@"profile_default_user", nil);
            }
        }
        
        [[mmyprofile singleton] changenameto:newtype name:updatename];
    }
}

#pragma mark public

@end