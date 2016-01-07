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
        self.userid = [FBSDKAccessToken currentAccessToken].userID;
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
    self.userid = [FBSDKAccessToken currentAccessToken].userID;
}

@end