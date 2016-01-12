#import "mdbcreate.h"

@implementation mdbcreate

+(void)create
{
    NSString *query;
    db *dbcon = [db begin];
    
    query = @"CREATE TABLE profile (id INTEGER PRIMARY KEY, created INTEGER, displ);";
    
    [dbcon query:query];
    
    [mdbcreate firstvalues:dbcon];
    
    [dbcon commit];
}

+(void)firstvalues:(db*)dbcon
{
    
}

@end