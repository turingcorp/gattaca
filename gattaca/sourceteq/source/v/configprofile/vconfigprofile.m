#import "vconfigprofile.h"

@implementation vconfigprofile

-(instancetype)init:(cconfigprofile*)controller
{
    self = [super init:controller];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
 
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    [flow setFooterReferenceSize:CGSizeZero];
    [flow setMinimumInteritemSpacing:0];
    [flow setMinimumLineSpacing:2];
    [flow setScrollDirection:UICollectionViewScrollDirectionVertical];
    [flow setSectionInset:UIEdgeInsetsMake(20, 0, menuheight + 20, 0)];
    
    UICollectionView *strongcollection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flow];
    [strongcollection setBackgroundColor:[UIColor clearColor]];
    [strongcollection setClipsToBounds:YES];
    [strongcollection setShowsHorizontalScrollIndicator:NO];
    [strongcollection setShowsVerticalScrollIndicator:NO];
    [strongcollection setAlwaysBounceVertical:YES];
    [strongcollection setDelegate:self];
    [strongcollection setDataSource:self];
    [strongcollection registerClass:[vconfigprofilecel class] forCellWithReuseIdentifier:celid];
    [strongcollection registerClass:[vconfigprofileheader class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerid];
    
    self.collection = strongcollection;
    [self addSubview:strongcollection];
    
    return self;
}

#pragma mark -
#pragma mark col del

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)col
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView*)col numberOfItemsInSection:(NSInteger)section
{
    return 0;
}

-(UICollectionReusableView*)collectionView:(UICollectionView*)col viewForSupplementaryElementOfKind:(NSString*)kind atIndexPath:(NSIndexPath*)index
{
    return [col dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:headerid forIndexPath:index];
}

-(UICollectionViewCell*)collectionView:(UICollectionView*)col cellForItemAtIndexPath:(NSIndexPath*)index
{
    return nil;
}

@end