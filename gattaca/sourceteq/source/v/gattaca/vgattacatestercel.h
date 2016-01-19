#import "appdel.h"

@class mgattacateststepitem;

@interface vgattacatestercel:UICollectionViewCell

-(void)config:(mgattacateststepitem*)item;

@property(weak, nonatomic)UIView *bg;
@property(weak, nonatomic)UIView *bgline;
@property(weak, nonatomic)UIImageView *image;

@end