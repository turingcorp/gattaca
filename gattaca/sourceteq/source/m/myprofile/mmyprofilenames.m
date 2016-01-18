#import "mmyprofilenames.h"

@implementation mmyprofilenames
{
    NSMutableArray *array;
}

+(NSString*)validname:(NSString*)name
{
    NSString *valid;
    
    if(name && name.length > 1)
    {
        valid = name;
    }
    
    return valid;
}

+(NSString*)namefortype:(profile_name)nametype
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
    
    return [mmyprofilenames validname:name];
}

+(mmyprofilename*)namemodel:(profile_name)nametype
{
    mmyprofilename *model;
    NSString *name = [mmyprofilenames namefortype:nametype];
    
    if(name)
    {
        model = [[mmyprofilename alloc] init:nametype value:name];
    }
    
    return model;
}

+(mmyprofilename*)firstvalid
{
    mmyprofilename *name = [mmyprofilenames namemodel:profile_name_firstname];

    if(!name)
    {
        name = [mmyprofilenames namemodel:profile_name_middlename];
    }
    
    if(!name)
    {
        name = [mmyprofilenames namemodel:profile_name_lastname];
    }
    
    return name;
}

-(instancetype)init
{
    self = [super init];
    
    array = [NSMutableArray array];
    [self addifvalid:profile_name_firstname];
    [self addifvalid:profile_name_middlename];
    [self addifvalid:profile_name_lastname];
    
    return self;
}

#pragma mark functionality

-(void)addifvalid:(profile_name)type
{
    mmyprofilename *name = [mmyprofilenames namemodel:profile_name_firstname];
    
    if(name)
    {
        [array addObject:name];
    }
}

#pragma mark public

-(NSInteger)count
{
    return array.count;
}

-(mmyprofilename*)name:(NSInteger)item
{
    return array[item];
}

@end