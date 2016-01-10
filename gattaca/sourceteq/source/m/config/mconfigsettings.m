#import "mconfigsettings.h"

@implementation mconfigsettings
{
    NSArray *array;
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

#pragma mark public

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

-(void)registerforcels:(UICollectionView*)collection
{
    NSMutableDictionary classes = [NSMutableDictionary dictionary];
    NSInteger qty = [self count];
    
    for(NSInteger i = 0; i < qty; i++)
    {
        Class c = [[self item:i] class];
        NSString *classname = NSStringFromClass(c);
        
        if(!classes[classname])
        {
            [classes setValue:c forKey:classname];
        }
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

@end