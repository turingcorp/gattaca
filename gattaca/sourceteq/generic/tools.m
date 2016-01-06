#import "tools.h"

@implementation tools
{
    NSNumberFormatter *numberformatter;
    CFStringRef stringref;
}

+(instancetype)sha
{
    static tools *sha;
    static dispatch_once_t once;
    dispatch_once(&once, ^(void) { sha = [[self alloc] init];});
    
    return sha;
}

+(void)rateapp
{
    NSUserDefaults *properties = [NSUserDefaults standardUserDefaults];
    
    [[UIApplication sharedApplication] openURL:
     [NSURL URLWithString:[NSString stringWithFormat:@"itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=%@", [properties valueForKey:@"appid"]]]];
}

+(NSDictionary*)defaultdict
{
    return [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"defs" ofType:@"plist"]];
}

+(NSInteger)timestamp
{
    return [NSDate date].timeIntervalSince1970;
}

#pragma mark -

-(instancetype)init
{
    self = [super init];
    
    stringref = (CFStringRef)@"!*'();:@&=+$,/?%#[]";
    numberformatter = [[NSNumberFormatter alloc] init];
    [numberformatter setNumberStyle:NSNumberFormatterDecimalStyle];
    
    return self;
}

#pragma mark public

-(NSString*)urlencode:(NSString*)_string
{
    return (__bridge_transfer NSString*)CFURLCreateStringByAddingPercentEscapes(nil, (__bridge CFStringRef)_string, nil, stringref, kCFStringEncodingUTF8);
}

-(NSString*)numbertostring:(NSNumber*)_number
{
    return [numberformatter stringFromNumber:_number];
}

@end