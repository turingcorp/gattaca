#import "vconfigsettings.h"

@implementation vconfigsettings

-(instancetype)init:(cconfigsettings*)controller
{
    self = [super init:controller];
    [self setBackgroundColor:[UIColor colorWithWhite:0.98 alpha:1]];
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    [flow setFooterReferenceSize:CGSizeZero];
    [flow setMinimumInteritemSpacing:0];
    [flow setMinimumLineSpacing:2];
    [flow setScrollDirection:UICollectionViewScrollDirectionVertical];
    [flow setSectionInset:UIEdgeInsetsMake(10, 0, menuheight + 20, 0)];
    
    UICollectionView *strongcollection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flow];
    [strongcollection setClipsToBounds:YES];
    [strongcollection setBackgroundColor:[UIColor clearColor]];
    [strongcollection setAlwaysBounceVertical:YES];
    [strongcollection setShowsHorizontalScrollIndicator:NO];
    [strongcollection setShowsVerticalScrollIndicator:NO];
    [strongcollection setDelegate:self];
    [strongcollection setDataSource:self];
    [strongcollection registerClass:[vconfigsettingsheader class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerid];
    [strongcollection setTranslatesAutoresizingMaskIntoConstraints:NO];
    [controller.model registercels:strongcollection];
    
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
    return CGSizeMake(self.bounds.size.width, 240);
}

-(CGSize)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout sizeForItemAtIndexPath:(NSIndexPath*)index
{
    return CGSizeMake(self.bounds.size.width, 60);
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)col
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView*)col numberOfItemsInSection:(NSInteger)section
{
    return [[(cconfigsettings*)self.controller model] count];
}

-(UICollectionReusableView*)collectionView:(UICollectionView*)col viewForSupplementaryElementOfKind:(NSString*)kind atIndexPath:(NSIndexPath*)index
{
    return [col dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:headerid forIndexPath:index];
}

-(UICollectionViewCell*)collectionView:(UICollectionView*)col cellForItemAtIndexPath:(NSIndexPath*)index
{
    id<mconfigsettingsprotocol> item = [[(cconfigsettings*)self.controller model] item:index.item];
    
    UICollectionViewCell<vconfigsettingscelprotocol> *cel = [col dequeueReusableCellWithReuseIdentifier:[item celname] forIndexPath:index];
    [cel config:item];
    
    return cel;
}

-(BOOL)collectionView:(UICollectionView*)col shouldSelectItemAtIndexPath:(NSIndexPath*)index
{
    BOOL should = NO;
    
    if([[[(cconfigsettings*)self.controller model] item:index.item] celclass] == [vconfigsettingsbutton class])
    {
        should = YES;
    }
    
    return should;
}

-(void)collectionView:(UICollectionView*)col didSelectItemAtIndexPath:(NSIndexPath*)index
{
    [[[(cconfigsettings*)self.controller model] item:index.item] change];
}

@end