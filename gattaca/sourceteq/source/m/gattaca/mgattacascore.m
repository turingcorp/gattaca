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
    mgattacascore *score = [[mgattacascore alloc] init:test_step_like];
    [score addkey:profile_like_science];
    [score addkey:profile_like_art];
    [score addkey:profile_like_social];
    [score addkey:profile_like_sport];
    
    return score;
}

+(instancetype)grounds
{
    mgattacascore *score = [[mgattacascore alloc] init:test_step_ground];
    [score addkey:profile_ground_cultural];
    [score addkey:profile_ground_entertainment];
    [score addkey:profile_ground_gaming];
    [score addkey:profile_ground_partying];
    
    return score;
}

-(instancetype)init:(test_step)type
{
    self = [super init];
    
    self.type = type;
    self.count = 0;
    dictionary = [NSMutableDictionary dictionary];
    
    return self;
}

#pragma mark functionality

-(NSString*)keytostring:(NSInteger)index
{
    return [NSString stringWithFormat:@"%@", @(index)];
}

-(void)addkey:(NSInteger)index
{
    dictionary[[self keytostring:index]] = [[mgattacascoreitem alloc] init:self.type index:index];
}

-(mgattacascoreitem*)item:(NSInteger)index
{
    return dictionary[[self keytostring:index]];
}

#pragma mark public

-(void)addto:(NSInteger)index
{
    self.count++;
    [[self item:index] add];
}

-(void)measure
{
    for(mgattacascoreitem *item in dictionary)
    {
    }
}

@end