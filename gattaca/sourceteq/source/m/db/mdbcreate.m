#import "mdbcreate.h"

@implementation mdbcreate

+(void)create
{
    NSString *query;
    db *dbcon = [db begin];
    
    query = @"CREATE TABLE profile (id INTEGER PRIMARY KEY, created INTEGER, syncstamp INTEGER, name INTEGER, namestr TEXT COLLATE NOCASE, age INTEGER, latitude INTEGER, longitude INTEGER);";
    
    [dbcon query:query];
    
    query = @"CREATE TABLE profilelike (id INTEGER PRIMARY KEY, liketype INTEGER, amount INTEGER, CONSTRAINT profilelike_unique unique(liketype));";
    
    [dbcon query:query];
    
    query = @"CREATE TABLE profileground (id INTEGER PRIMARY KEY, groundtype INTEGER, amount INTEGER, CONSTRAINT profileground_unique unique(groundtype));";
    
    [dbcon query:query];
    
    [mdbcreate firstvalues:dbcon];
    
    [dbcon commit];
}

+(void)firstvalues:(db*)dbcon
{
    NSString *query;
    NSInteger amount = 250;
    
    query = [NSString stringWithFormat:@"INSERT INTO profilelike (liketype, amount) values(%@, %@);", @(profile_like_science), @(amount)];
    [dbcon query:query];
    query = [NSString stringWithFormat:@"INSERT INTO profilelike (liketype, amount) values(%@, %@);", @(profile_like_art), @(amount)];
    [dbcon query:query];
    query = [NSString stringWithFormat:@"INSERT INTO profilelike (liketype, amount) values(%@, %@);", @(profile_like_sport), @(amount)];
    [dbcon query:query];
    query = [NSString stringWithFormat:@"INSERT INTO profilelike (liketype, amount) values(%@, %@);", @(profile_like_social), @(amount)];
    [dbcon query:query];
    
    query = [NSString stringWithFormat:@"INSERT INTO profileground (groundtype, amount) values(%@, %@);", @(profile_ground_cultural), @(amount)];
    [dbcon query:query];
    query = [NSString stringWithFormat:@"INSERT INTO profileground (groundtype, amount) values(%@, %@);", @(profile_ground_gaming), @(amount)];
    [dbcon query:query];
    query = [NSString stringWithFormat:@"INSERT INTO profileground (groundtype, amount) values(%@, %@);", @(profile_ground_entertainment), @(amount)];
    [dbcon query:query];
    query = [NSString stringWithFormat:@"INSERT INTO profileground (groundtype, amount) values(%@, %@);", @(profile_ground_partying), @(amount)];
    [dbcon query:query];
}

@end