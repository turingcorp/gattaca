#import "appdel.h"

extern NSString *documents;
extern NSInteger screenwidth;
extern NSInteger screenwidth_2;
extern NSInteger screenheight;
extern NSInteger screenheight_2;
extern CGRect screenrect;
extern CGFloat pixelsize2;
extern CGFloat pixelsize_2;
extern apptype applicationtype;
extern ioslevel applicationios;

@interface updater:NSObject

+(void)launch;

@end