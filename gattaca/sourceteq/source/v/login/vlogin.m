#import "vlogin.h"

@implementation vlogin
{
    NSString *indicatorid;
    NSInteger indiwidth;
    NSInteger indicatorwidth;
    NSInteger indicatorheight;
}

-(instancetype)init
{
    self = [super init];
    [self setBackgroundColor:[UIColor whiteColor]];
    indicatorid = @"indicator";
    indicatorwidth = 12;
    indicatorheight = 12;
    self.model = [mlogin generate];
    indiwidth = indicatorwidth * [self.model count];
    
    UICollectionViewFlowLayout *flowsteps = [[UICollectionViewFlowLayout alloc] init];
    [flowsteps setFooterReferenceSize:CGSizeZero];
    [flowsteps setHeaderReferenceSize:CGSizeZero];
    [flowsteps setMinimumInteritemSpacing:0];
    [flowsteps setMinimumLineSpacing:0];
    [flowsteps setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    
    UICollectionViewFlowLayout *flowindicator = [[UICollectionViewFlowLayout alloc] init];
    [flowindicator setFooterReferenceSize:CGSizeZero];
    [flowindicator setHeaderReferenceSize:CGSizeZero];
    [flowindicator setMinimumInteritemSpacing:0];
    [flowindicator setMinimumLineSpacing:0];
    [flowindicator setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    
    UICollectionView *strongsteps = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowsteps];
    [strongsteps setClipsToBounds:YES];
    [strongsteps setBackgroundColor:[UIColor clearColor]];
    [strongsteps setShowsHorizontalScrollIndicator:NO];
    [strongsteps setShowsVerticalScrollIndicator:NO];
    [strongsteps setAlwaysBounceHorizontal:YES];
    [strongsteps setPagingEnabled:YES];
    [strongsteps setDelegate:self];
    [strongsteps setDataSource:self];
    [strongsteps registerClass:[vlogincel class] forCellWithReuseIdentifier:celid];
    [strongsteps setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.steps = strongsteps;
    
    UICollectionView *strongindicators = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowindicator];
    [strongindicators setClipsToBounds:YES];
    [strongindicators setBackgroundColor:[UIColor clearColor]];
    [strongindicators setShowsHorizontalScrollIndicator:NO];
    [strongindicators setShowsVerticalScrollIndicator:NO];
    [strongindicators setAlwaysBounceHorizontal:YES];
    [strongindicators setDelegate:self];
    [strongindicators setDataSource:self];
    [strongindicators registerClass:[vloginindicatorcel class] forCellWithReuseIdentifier:indicatorid];
    [strongindicators setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.indicators = strongindicators;
    
    [self addSubview:strongsteps];
    [self addSubview:strongindicators];
    
    NSDictionary *views = @{@"steps":strongsteps, @"indicators":strongindicators};
    NSDictionary *metrics = @{@"indiheight":@(indicatorheight)};
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[steps]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[steps]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[indicators]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[indicators(indiheight)]-180-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark -
#pragma mark col del

-(UIEdgeInsets)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout insetForSectionAtIndex:(NSInteger)section
{
    UIEdgeInsets insets;
    
    if(self.steps == col)
    {
        insets = UIEdgeInsetsZero;
    }
    else
    {
        NSInteger indix = (self.bounds.size.width - indiwidth) / 2;
        insets = UIEdgeInsetsMake(0, indix, 0, indix);
    }
    
    return insets;
}

-(CGSize)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout sizeForItemAtIndexPath:(NSIndexPath*)index
{
    NSInteger width;
    NSInteger height;
    
    if(self.steps == col)
    {
        width = self.bounds.size.width;
        height = self.bounds.size.height;
    }
    else
    {
        width = indicatorwidth;
        height = indicatorheight;
    }
    
    return CGSizeMake(width, height);
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)col
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView*)col numberOfItemsInSection:(NSInteger)section
{
    return self.model.count;
}

-(UICollectionViewCell*)collectionView:(UICollectionView*)col cellForItemAtIndexPath:(NSIndexPath*)index
{
    NSInteger item = index.item;
    UICollectionViewCell *cel;
 
    if(self.steps == col)
    {
        cel = [col dequeueReusableCellWithReuseIdentifier:celid forIndexPath:index];
        [(vlogincel*)cel config:[self.model step:item]];
    }
    else
    {
        cel = [col dequeueReusableCellWithReuseIdentifier:indicatorid forIndexPath:index];
        [cel setSelected:item == self.model.selected];
    }
    
    return cel;
}

@end