#import "mconfigsettings.h"

@implementation mconfigsettings

@synthesize array;

#pragma mark public

-(void)registercels:(UICollectionView*)collection
{
    NSInteger qty = [self count];
    
    for(NSInteger i = 0; i < qty; i++)
    {
        id<mconfigsettingsprotocol> item = [self item:i];
        [collection registerClass:[item celclass] forCellWithReuseIdentifier:[item celname]];
    }
}

#pragma mark -
#pragma mark config protocol

-(UIViewController*)controller
{
    return [[cconfigsettings alloc] init:self];
}

-(NSString*)title
{
    return NSLocalizedString(@"config_settings_title", nil);
}

-(NSString*)descr
{
    return NSLocalizedString(@"config_settings_descr", nil);
}

-(NSString*)image
{
    return @"";
}

-(UIColor*)color
{
    return [UIColor colorWithRed:1 green:0 blue:0 alpha:1];
}

-(void)lazyload
{
    array = [NSArray arrayWithObjects:
             [[mconfigsettingsnotifications alloc] init],
             [[mconfigsettingsreview alloc] init],
             [[mconfigsettingslogout alloc] init],
             [[mconfigsettingsdelete alloc] init],
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

-(id<mconfigsettingsprotocol>)item:(NSInteger)item
{
    return array[item];
}

@end