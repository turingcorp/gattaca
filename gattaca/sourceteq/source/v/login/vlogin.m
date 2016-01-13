#import "vlogin.h"

@implementation vlogin
{
    NSString *indicatorid;
    NSInteger indiwidth;
    NSInteger indicatorwidth;
    NSInteger indicatorheight;
}

-(instancetype)init:(clogin*)controller
{
    self = [super init:controller];
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
    
    UICollectionView *steps = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowsteps];
    [steps setClipsToBounds:YES];
    [steps setBackgroundColor:[UIColor clearColor]];
    [steps setShowsHorizontalScrollIndicator:NO];
    [steps setShowsVerticalScrollIndicator:NO];
    [steps setAlwaysBounceHorizontal:YES];
    [steps setPagingEnabled:YES];
    [steps setDelegate:self];
    [steps setDataSource:self];
    [steps registerClass:[vlogincel class] forCellWithReuseIdentifier:celid];
    [steps setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.steps = steps;
    
    UICollectionView *indicators = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowindicator];
    [indicators setClipsToBounds:YES];
    [indicators setBackgroundColor:[UIColor clearColor]];
    [indicators setShowsHorizontalScrollIndicator:NO];
    [indicators setShowsVerticalScrollIndicator:NO];
    [indicators setAlwaysBounceHorizontal:YES];
    [indicators setDelegate:self];
    [indicators setDataSource:self];
    [indicators registerClass:[vloginindicatorcel class] forCellWithReuseIdentifier:indicatorid];
    [indicators setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.indicators = indicators;
    
    FBSDKLoginButton *btnlogin = [[FBSDKLoginButton alloc] init];
    [btnlogin setTranslatesAutoresizingMaskIntoConstraints:NO];
    btnlogin.readPermissions = @[@"public_profile"];
    [btnlogin setDelegate:controller];
    
    UILabel *disclaimer = [[UILabel alloc] init];
    [disclaimer setBackgroundColor:[UIColor clearColor]];
    [disclaimer setFont:[UIFont fontWithName:fontname size:17]];
    [disclaimer setTextColor:[UIColor colorWithWhite:0 alpha:0.5]];
    [disclaimer setNumberOfLines:0];
    [disclaimer setTextAlignment:NSTextAlignmentCenter];
    [disclaimer setText:NSLocalizedString(@"login_disclaimer", nil)];
    [disclaimer setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self addSubview:steps];
    [self addSubview:indicators];
    [self addSubview:disclaimer];
    [self addSubview:btnlogin];
    
    NSDictionary *views = @{@"steps":steps, @"indicators":indicators, @"btn":btnlogin, @"disclaimer":disclaimer};
    NSDictionary *metrics = @{@"indiheight":@(indicatorheight)};
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[steps]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[steps]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[indicators]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[indicators(indiheight)]-30-[btn(40)]-20-[disclaimer]-40-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[disclaimer]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[btn]-20-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark functionality

-(void)indicatorselect:(NSInteger)item
{
    [self.indicators selectItemAtIndexPath:[NSIndexPath indexPathForItem:item inSection:0] animated:YES scrollPosition:UICollectionViewScrollPositionNone];
}

-(void)stepscroll:(NSInteger)item
{
    [self.steps scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:item inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
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
        [self indicatorselect:item];
    }
    else
    {
        cel = [col dequeueReusableCellWithReuseIdentifier:indicatorid forIndexPath:index];
        [cel setSelected:item == self.model.selected];
    }
    
    return cel;
}

-(BOOL)collectionView:(UICollectionView*)col shouldSelectItemAtIndexPath:(NSIndexPath*)index
{
    BOOL should = NO;
    
    if(self.indicators == col)
    {
        should = YES;
    }
    
    return should;
}

-(void)collectionView:(UICollectionView*)col didSelectItemAtIndexPath:(NSIndexPath*)index
{
    NSInteger item = index.item;
    [self stepscroll:item];
}

@end