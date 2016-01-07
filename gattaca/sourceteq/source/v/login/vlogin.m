#import "vlogin.h"

@implementation vlogin

-(instancetype)init
{
    self = [super init];
    [self setBackgroundColor:[UIColor whiteColor]];
    self.model = [mlogin generate];
    
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
    return self.model.count;
}

-(UICollectionViewCell*)collectionView:(UICollectionView*)_col cellForItemAtIndexPath:(NSIndexPath*)_index
{
    UICollectionViewCell *cel;
    
    return cel;
}

@end