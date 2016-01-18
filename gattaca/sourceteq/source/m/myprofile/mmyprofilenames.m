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

+(NSString*)firstvalid
{
    NSString *name;

    name = [mmyprofilenames namefortype:profile_name_firstname];
    
    if(!name)
    {
        name = [mmyprofilenames namefortype:profile_name_middlename];
    }
    else
    {
        name = [mmyprofilenames namefortype:profile_name_lastname];
    }
    
    return name;
}

-(instancetype)init
{
    self = [super init];
    
    array = [NSMutableArray array];
    
    
    
    return self;
}

#pragma mark functionality

-(void)add:(profile_name)type value:(NSString*)value
{
    [array addObject:[[mmyprofilename alloc] init:type value:value]];
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