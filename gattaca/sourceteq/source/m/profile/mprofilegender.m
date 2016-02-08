#import "mprofilegender.h"
#import "mprofilegenderfemale.h"
#import "mprofilegendermale.h"

@implementation mprofilegender

+(instancetype)gender:(profile_gender)gender
{
    mprofilegender *model;
    
    switch(gender)
    {
        case profile_gender_female:
            
            model = [[mprofilegenderfemale alloc] init];
            
            break;
            
        case profile_gender_male:
            
            model = [[mprofilegendermale alloc] init];
            
            break;
    }
    
    return model;
}

-(UIColor*)color
{
    return [UIColor clearColor];
}

@end