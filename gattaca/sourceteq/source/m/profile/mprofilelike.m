#import "mprofilelike.h"

@implementation mprofilelike
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

-(id<mprofilelikeprotocol>)factory:(profile_like)like amount:(NSInteger)amount
{
    id<mprofilelikeprotocol> item;
    
    switch(like)
    {
        case profile_like_science:
            
            item = [[mprofilelikescience alloc] init:amount];
            
            break;
            
        case profile_like_art:
            
            item = [[mprofilelikeart alloc] init:amount];
            
            break;
            
        case profile_like_social:
            
            item = [[mprofilelikesocial alloc] init:amount];
            
            break;
            
        case profile_like_sport:
            
            item = [[mprofilelikesport alloc] init:amount];
            
            break;
    }
    
    return item;
}

-(void)loadfromdb
{
    dictionary = [NSMutableDictionary dictionary];
    NSString *query = @"SELECT liketype, amount FROM profilelike ORDER BY liketype ASC;";
    NSArray *rows = [db rows:query];
    NSInteger count = rows.count;
    
    for(NSInteger i = 0; i < count; i++)
    {
        NSDictionary *raw = rows[i];
        profile_like liketype = (profile_like)[raw[@"liketype"] integerValue];
        NSInteger amount = [raw[@"amount"] integerValue];
        
        dictionary[[self liketokey:liketype]] = [self factory:liketype amount:amount];
    }
}

-(NSString*)liketokey:(profile_like)like
{
    return [NSString stringWithFormat:@"%@", @(like)];
}

#pragma mark public

-(NSInteger)count
{
    return dictionary.allKeys.count;
}

-(id<mprofilelikeprotocol>)item:(NSInteger)index
{
    return dictionary[[self liketokey:(profile_like)index]];
}

-(void)update:(id<mprofilelikeprotocol>)like amount:(NSInteger)newamount
{
    [like newamount:newamount];
    
    NSString *query = [NSString stringWithFormat:
                       @"UPDATE profilelike set amount=%@ where liketype=%@;",
                       @([like type]), @(newamount)];
    [db query:query];
}

-(id<mprofilelikeprotocol>)like:(profile_like)like
{
    return dictionary[[self liketokey:like]];
}

@end