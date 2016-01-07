#import "vlogin.h"

@implementation vlogin

-(instancetype)init
{
    self = [super init];
    [self setBackgroundColor:[UIColor whiteColor]];
    
    return self;
}

#pragma mark -
#pragma mark col del

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)_col
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView*)_col numberOfItemsInSection:(NSInteger)_section
{
    NSInteger items;
    
    return items;
}

@end