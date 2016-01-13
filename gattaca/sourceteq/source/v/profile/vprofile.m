#import "vprofile.h"

@implementation vprofile

+(UIColor*)colorforgender:(profile_gender)gender
{
    UIColor *color;
    
    switch(gender)
    {
        case profile_gender_male:
            
            color = [UIColor colorWithRed:1 green:0.6 blue:0 alpha:1];
            
            break;
            
        case profile_gender_female:
            
            color = [UIColor colorWithRed:1 green:0 blue:0.5 alpha:1];
            
            break;
    }
    
    return color;
}

-(instancetype)init
{
    self = [super init];
    
    vprofilecircle *circle = [[vprofilecircle alloc] init];
    
    [self addSubview:circle];
    
    return self;
}

@end