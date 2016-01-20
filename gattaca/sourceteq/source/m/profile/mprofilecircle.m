#import "mprofilecircle.h"

@implementation mprofilecircle
{
    NSMutableDictionary *dictionary;
}

+(id<mprofilecircleprotocol>)circle:(profile_circle)type amount:(NSInteger)amount
{
    id<mprofilecircleprotocol> item;
    
    switch(type)
    {
        case profile_circle_math:
            
            
            
            break;
            
        case profile_circle_music:
            
            
            
            break;
            
        case profile_circle_politics:
            
            
            
            break;
            
        case profile_circle_leisure:
            
            
            
            break;
    }
    
    return item;
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

-(void)loadfromdb
{
    dictionary = [NSMutableDictionary dictionary];
    NSString *query = @"SELECT circletype, amount FROM profilecircle ORDER BY circletype ASC;";
    NSArray *rows = [db rows:query];
    NSInteger count = rows.count;
    
    for(NSInteger i = 0; i < count; i++)
    {
        NSDictionary *raw = rows[i];
        NSInteger amount = [raw[@"amount"] integerValue];
        profile_circle type = (profile_circle)[raw[@"circletype"] integerValue];
        
        dictionary[[tools typetokey:type]] = [mprofilecircle circle:type amount:amount];
    }
}

#pragma mark public

-(id<mprofilecircleprotocol>)item:(profile_circle)type
{
    return dictionary[[tools typetokey:type]];
}

@end