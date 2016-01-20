#import "mprofileground.h"

@implementation mprofileground
{
    NSMutableDictionary *dictionary;
}

-(instancetype)init
{
    self = [super init];
    
    [self loadfromdb];
    
    return self;
}

-(instancetype)init:(NSDictionary*)json
{
    self = [super init];
    
    return self;
}

#pragma mark functionality

-(id<mprofilegroundprotocol>)factory:(profile_ground)ground amount:(NSInteger)amount
{
    id<mprofilegroundprotocol> item;
    
    switch(ground)
    {
        case profile_ground_cultural:
            
            item = [[mprofilegroundcultural alloc] init:amount];
            
            break;
            
        case profile_ground_gaming:
            
            item = [[mprofilegroundgaming alloc] init:amount];
            
            break;
            
        case profile_ground_entertainment:
            
            item = [[mprofilegroundenter alloc] init:amount];
            
            break;
            
        case profile_ground_partying:
            
            item = [[mprofilegroundpartying alloc] init:amount];
            
            break;
    }
    
    return item;
}

-(void)loadfromdb
{
    dictionary = [NSMutableDictionary dictionary];
    NSString *query = @"SELECT groundtype, amount FROM profileground ORDER BY groundtype ASC;";
    NSArray *rows = [db rows:query];
    NSInteger count = rows.count;
    
    for(NSInteger i = 0; i < count; i++)
    {
        NSDictionary *raw = rows[i];
        profile_ground groundtype = (profile_ground)[raw[@"groundtype"] integerValue];
        NSInteger amount = [raw[@"amount"] integerValue];
        
        dictionary[[self groundtokey:groundtype]] = [self factory:groundtype amount:amount];
    }
}

-(NSString*)groundtokey:(profile_ground)ground
{
    return [NSString stringWithFormat:@"%@", @(ground)];
}

#pragma mark public

-(NSInteger)count
{
    return dictionary.allKeys.count;
}

-(id<mprofilegroundprotocol>)item:(NSInteger)index
{
    return dictionary[[self groundtokey:(profile_ground)index]];
}

-(void)update:(id<mprofilegroundprotocol>)ground amount:(NSInteger)newamount
{
    [ground newamount:newamount];
    
    NSString *query = [NSString stringWithFormat:
                       @"UPDATE profileground set amount=%@ where groundtype=%@;",
                       @([ground type]), @(newamount)];
    [db query:query];
}

-(id<mprofilegroundprotocol>)ground:(profile_ground)ground
{
    return dictionary[[self groundtokey:ground]];
}

@end