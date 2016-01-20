#import "mconfigprofile.h"

@implementation mconfigprofile

@synthesize array;

#pragma mark -
#pragma mark config protocol

-(UIViewController*)controller
{
    return [[cprofile alloc] init:self];
}

-(NSString*)title
{
    return NSLocalizedString(@"config_profile_title", nil);
}

-(NSString*)descr
{
    return NSLocalizedString(@"config_profile_descr", nil);
}

-(NSString*)image
{
    return @"";
}

-(UIColor*)color
{
    return colormain;
}

-(void)lazyload
{
    array = [NSArray arrayWithObjects:
             [[mconfigprofileedit alloc] init],
             [[mconfigprofilename alloc] init],
             [[mconfigprofileage alloc] init],
             nil];
}

-(NSInteger)count
{
    if(!array)
    {
        [self lazyload];
    }
    
    return array.count;
}

-(id<mconfigprofileprotocol>)item:(NSInteger)item
{
    return array[item];
}

@end