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

+(GLKVector4)colorfor:(beadcolor)_color
{
    GLKVector4 color;
    
    switch(_color)
    {
        case beadcolorred:
            
            color = GLKVector4Make(1, 0, 0, 1);
            
            break;
            
        case beadcolorblue:
            
            color = GLKVector4Make(0.1, 0.2, 1, 1);
            
            break;
            
        case beadcolorgreen:
            
            color = GLKVector4Make(0, 1, 0, 1);
            
            break;
            
        case beadcoloraqua:
            
            color = GLKVector4Make(0.2, 0.5, 0.7, 1);
            
            break;
            
        case beadcolorgray:
            
            color = GLKVector4Make(0.4, 0.4, 0.4, 1);
            
            break;
            
        case beadcolororange:
            
            color = GLKVector4Make(1, 0.5, 0, 1);
            
            break;
            
        case beadcolorpink:
            
            color = GLKVector4Make(0.9, 0, 0.8, 1);
            
            break;
            
        case beadcoloryellow:
            
            color = GLKVector4Make(0.8, 0.8, 0, 1);
            
            break;
            
        case beadcolornone:
            
            color = GLKVector4Make(0.9, 0.9, 0.9, 1);
            
            break;
    }
    
    return color;
}

+(NSString*)imageforoperation:(beadop)_op
{
    NSString *image;
    
    switch(_op)
    {
        case beadopadd:
            
            image = @"add";
            
            break;
            
        case beadopsubstract:
            
            image = @"substract";
            
            break;
            
        case beadopmultiply:
            
            image = @"multiply";
            
            break;
            
        case beadopdivision:
            
            image = @"divide";
            
            break;
            
        case beadopnone:
            
            image = @"point";
            
            break;
    }
    
    return image;
}

+(UIColor*)colorwithvector:(GLKVector4)_vector
{
    UIColor *color = [UIColor colorWithRed:_vector.x green:_vector.y blue:_vector.z alpha:_vector.w];
    
    return color;
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