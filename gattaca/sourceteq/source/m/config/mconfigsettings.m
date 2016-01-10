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

-(NSInteger)countclasses
{
    
}

-(Class)classname:(NSInteger)item
{
    
}

-(NSInteger*)identifier:(NSInteger)item;
{
    
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