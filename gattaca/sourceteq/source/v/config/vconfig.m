#import "vconfig.h"

@implementation vconfig

-(instancetype)init:(cconfigmain*)controller
{
    self = [super init:controller];
    [self setBackgroundColor:[UIColor whiteColor]];
    self.model = [mconfig generate];
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    [flow setFooterReferenceSize:CGSizeZero];
    [flow setHeaderReferenceSize:CGSizeZero];
    [flow setMinimumInteritemSpacing:0];
    [flow setMinimumLineSpacing:0];
    [flow setScrollDirection:UICollectionViewScrollDirectionVertical];
    [flow setSectionInset:UIEdgeInsetsMake(0, 0, menuheight + 20, 0)];
    
    UICollectionView *strongcollection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flow];
    [strongcollection setBackgroundColor:[UIColor clearColor]];
    [strongcollection setShowsHorizontalScrollIndicator:NO];
    [strongcollection setShowsVerticalScrollIndicator:NO];
    [strongcollection setAlwaysBounceVertical:YES];
    [strongcollection setDelegate:self];
    [strongcollection setDataSource:self];
    [strongcollection setClipsToBounds:YES];
    [strongcollection registerClass:[vconfigcel class] forCellWithReuseIdentifier:celid];
    [strongcollection setTranslatesAutoresizingMaskIntoConstraints:NO];

    self.collection = strongcollection;
    [self addSubview:strongcollection];
    
    NSDictionary *views = @{@"col":strongcollection};
    NSDictionary *metrics = @{};
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark public

-(void)refresh
{
    [self.collection reloadData];
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
    return [self.model count];
}

-(UICollectionViewCell*)collectionView:(UICollectionView*)col cellForItemAtIndexPath:(NSIndexPath*)index
{
    vconfigcel *cel = [col dequeueReusableCellWithReuseIdentifier:celid forIndexPath:index];
    [cel config:[self.model item:index.item]];
    
    return cel;
}

-(void)collectionView:(UICollectionView*)col didSelectItemAtIndexPath:(NSIndexPath*)index
{
    [(cconfigmain*)self.controller push:[self.model item:index.item]];
}

@end