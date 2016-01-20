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
    
    self.count = 0;
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

-(mgattacascoreitem*)likeitem:(profile_like)type
{
    return dictionary[[self keyliketostring:type]];
}

-(mgattacascoreitem*)grounditem:(profile_ground)type
{
    return dictionary[[self keygroundtostring:type]];
}

-(void)addtolike:(profile_like)type
{
    [[self likeitem:type] add];
}

-(void)addtoground:(profile_ground)type
{
    [[self grounditem:type] add];
}

#pragma mark public

-(void)addto:(test_step)step type:(NSInteger)index
{
    self.count++;
    
    switch(step)
    {
        case test_step_like:
            
            [self addtolike:(profile_like)index];
            
            break;
            
        case test_step_ground:
            
            [self addtoground:(profile_ground)index];
            
            break;
    }
}

-(void)measure
{
    for(mgattacascoreitem *item in dictionary)
    {
        here
    }
}

@end