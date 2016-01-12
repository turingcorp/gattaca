#import "mdb.h"

@implementation mdb

+(void)firsttime
{/*
    NSUserDefaults *userdef = [NSUserDefaults standardUserDefaults];
    NSDictionary *def = [tools defaultdict];
    
    NSString *defdbname = def[@"dbname"];
    NSString *defdbfolder = def[@"dbfolder"];
    NSString *relative = [defdbfolder stringByAppendingPathComponent:defdbname];
    [userdef setValue:relative forKey:@"dbname"];
    
    NSString *bundledb = _defaults[@"dbname"];
    NSString *dbfolder = _defaults[@"dbfolder"];
    NSString *relativedb = [dbfolder stringByAppendingPathComponent:bundledb];
    imagesfolder = _defaults[@"imagesfolder"];
    [_properties setValue:relativedb forKey:@"dbname"];
    [_properties setValue:imagesfolder forKey:@"imagesfolder"];
    
    dbfolder = [documents stringByAppendingPathComponent:dbfolder];
    imagesfolder = [documents stringByAppendingPathComponent:imagesfolder];
    dbname = [documents stringByAppendingPathComponent:relativedb];
    NSString *originaldb = [[NSBundle mainBundle] pathForResource:bundledb ofType:@""];
    [moddirs create:[NSURL fileURLWithPath:dbfolder]];
    [moddirs create:[NSURL fileURLWithPath:imagesfolder]];
    [moddirs copy:originaldb to:dbname];*/
}

+(void)updatedb
{
    
}

@end