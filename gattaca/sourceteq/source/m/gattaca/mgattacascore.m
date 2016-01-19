#import "mgattacascore.h"

@implementation mgattacascore
{
    NSMutableDictionary *dictionary;
}

+(instancetype)scorefor:(test_step)type
{
    mgattacascore *score;
    
    switch(type)
    {
        case test_step_like:
            
            score = [mgattacascore likes];
            
            break;
            
            
        case test_step_ground:
            
            score = [mgattacascore grounds];
            
            break;
    }
    
    return score;
}

+(instancetype)likes
{
    mgattacascore *score = [[mgattacascore alloc] init];
    [score addkeylike:profile_like_science];
    [score addkeylike:profile_like_art];
    [score addkeylike:profile_like_social];
    [score addkeylike:profile_like_sport];
    
    return score;
}

+(instancetype)grounds
{
    mgattacascore *score = [[mgattacascore alloc] init];
    [score addkeyground:profile_ground_cultural];
    [score addkeyground:profile_ground_entertainment];
    [score addkeyground:profile_ground_gaming];
    [score addkeyground:profile_ground_partying];
    
    return score;
}

-(instancetype)init
{
    self = [super init];
    
    dictionary = [NSMutableDictionary dictionary];
    
    return self;
}

#pragma mark functionality

-(NSString*)keyliketostring:(profile_like)type
{
    return [NSString stringWithFormat:@"%@", @(type)];
}

-(NSString*)keygroundtostring:(profile_ground)type
{
    return [NSString stringWithFormat:@"%@", @(type)];
}

-(void)addkeylike:(profile_like)type
{
    dictionary[[self keyliketostring:type]] = [[mgattacascoreitem alloc] init:test_step_like index:type];
}

-(void)addkeyground:(profile_ground)type
{
    dictionary[[self keygroundtostring:type]] = [[mgattacascoreitem alloc] init:test_step_ground index:type];
}

#pragma mark public

@end