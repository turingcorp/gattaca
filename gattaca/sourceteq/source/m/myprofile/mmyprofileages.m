#import "mmyprofileages.h"

@implementation mmyprofileages
{
    NSMutableArray *array;
}

-(instancetype)init
{
    self = [super init];
 
    array = [NSMutableArray array];
    NSDictionary *defaults = [NSDictionary dictionaryWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"profile" withExtension:@"plist"]];
    
    NSInteger agemin = [defaults[@"agemin"] integerValue];
    NSInteger agemax = [defaults[@"agemax"] integerValue];
    NSInteger currentage = [mmyprofile singleton].age;
    
    if(!currentage)
    {
        currentage = agemin + 10;
    }
    
    for(NSInteger i = agemin; i <= agemax; i++)
    {
        if(i == currentage)
        {
            self.current = i;
        }
        
        [array addObject:[[mmyprofileage alloc] init:i]];
    }
    
    return self;
}

#pragma mark public

-(NSInteger)count
{
    return array.count;
}

-(mmyprofileage*)item:(NSInteger)index;
{
    return array[index];
}

@end