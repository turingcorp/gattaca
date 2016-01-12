#import "vconfigprofile.h"

@implementation vconfigprofile

-(instancetype)init:(cprofile*)controller
{
    self = [super init:controller];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor colorWithWhite:0.9 alpha:1]];
 
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    [flow setFooterReferenceSize:CGSizeZero];
    [flow setMinimumInteritemSpacing:0];
    [flow setMinimumLineSpacing:10];
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
    [strongcollection setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    self.collection = strongcollection;
    [self addSubview:strongcollection];
    
    NSDictionary *views = @{@"col":strongcollection};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark -
#pragma mark col del

-(CGSize)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(self.bounds.size.width, 320);
}

-(CGSize)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout sizeForItemAtIndexPath:(NSIndexPath*)index
{
    return CGSizeMake(self.bounds.size.width, 50);
}

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