#import "cloading.h"

@implementation cloading

-(instancetype)init
{
    self = [super init];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notifiedloadingfinished:) name:notloadfinish object:nil];
    
    return self;
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void)loadView
{
    self.view = [[vloading alloc] init];
}

#pragma mark notifications

-(void)notifiedloadingfinished:(NSNotification*)notification
{
    if([msession singleton].userid)
    {
        [[mmyprofile singleton] loaduser];
        
        NSString *newnamestr;
        NSString *firstname = ;
        NSString *middlename;
        NSString *lastname;
        
        switch([mmyprofile singleton].nametype)
        {
            case profile_name_firstname:
                
                break;
                
            case profile_name_middelname:
                
                break;
                
            case profile_name_lastname:
                
                break;
        }
        
        //[self opensection:[msection browse] animated:NO];
    }
    else
    {
        [clogin asklogin:NO];
    }
}

@end