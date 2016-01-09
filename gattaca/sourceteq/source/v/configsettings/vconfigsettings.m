#import "vconfigsettings.h"

@implementation vconfigsettings

-(instancetype)init:(cconfigsettings*)controller
{
    self = [super init:controller];
    [self setBackgroundColor:[UIColor whiteColor]];
    
    return self;
}

#pragma mark -
#pragma mark col del

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)col
{
    return 0;
}

-(NSInteger)collectionView:(UICollectionView*)col numberOfItemsInSection:(NSInteger)section
{
    return 0;
}

-(UICollectionViewCell*)collectionView:(UICollectionView*)col cellForItemAtIndexPath:(NSIndexPath*)index
{
    return nil;
}

@end