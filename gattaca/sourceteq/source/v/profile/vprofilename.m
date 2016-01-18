#import "vprofilename.h"

@implementation vprofilename

-(instancetype)init:(cprofilename*)controller
{
    self = [super init:controller];
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    [flow setFooterReferenceSize:CGSizeZero];
    [flow setHeaderReferenceSize:CGSizeZero];
    [flow setMinimumInteritemSpacing:0];
    [flow setMinimumLineSpacing:10];
    [flow setScrollDirection:UICollectionViewScrollDirectionVertical];
    [flow setSectionInset:UIEdgeInsetsMake(20, 0, 0, 0)];
    
    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flow];
    [collection setBackgroundColor:[UIColor clearColor]];
    [collection setClipsToBounds:YES];
    [collection setScrollEnabled:NO];
    [collection setBounces:NO];
    [collection setDelegate:self];
    [collection setDataSource:self];
    [collection registerClass:[vprofilenamecel class] forCellWithReuseIdentifier:celid];
    
    [self addSubview:collection];
    
    return self;
}

#pragma mark -
#pragma mark col del

-(CGSize)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout sizeForItemAtIndexPath:(NSIndexPath*)index
{
    return CGSizeMake(self.bounds.size.width, 80);
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)col
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView*)col numberOfItemsInSection:(NSInteger)section
{
    return 0;
}

-(UICollectionViewCell*)collectionView:(UICollectionView*)col cellForItemAtIndexPath:(NSIndexPath*)index
{
    vprofilenamecel *cel = [col dequeueReusableCellWithReuseIdentifier:celid forIndexPath:index];
    
    return cel;
}

@end