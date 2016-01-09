#import "vmenu.h"

@implementation vmenu

+(void)addto:(UIView*)view
{
    vmenu *menu = [[vmenu alloc] init];
    
    [view addSubview:menu];
    NSDictionary *views = @{@"menu":menu};
    NSDictionary *metrics = @{@"menuheight":@(menuheight)};
    
    [view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[menu]-0-|" options:0 metrics:metrics views:views]];
    [view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[menu(menuheight)]-0-|" options:0 metrics:metrics views:views]];
}

-(instancetype)init
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    self.sections = [msection menu];
    vblur *blur = [vblur light];
    
    UIView *border = [[UIView alloc] init];
    [border setTranslatesAutoresizingMaskIntoConstraints:NO];
    [border setUserInteractionEnabled:NO];
    [border setBackgroundColor:colormain];
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    [flow setFooterReferenceSize:CGSizeZero];
    [flow setHeaderReferenceSize:CGSizeZero];
    [flow setItemSize:CGSizeMake(60, 50)];
    [flow setMinimumLineSpacing:0];
    [flow setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    [flow setSectionInset:UIEdgeInsetsZero];
    
    UICollectionView *strongcollection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flow];
    [strongcollection setClipsToBounds:YES];
    [strongcollection setBackgroundColor:[UIColor clearColor]];
    [strongcollection setDataSource:self];
    [strongcollection setDelegate:self];
    [strongcollection setBounces:NO];
    [strongcollection setScrollEnabled:NO];
    [strongcollection registerClass:[vmenucel class] forCellWithReuseIdentifier:celid];
    [strongcollection setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.collection = strongcollection;
    
    [self addSubview:blur];
    [self addSubview:border];
    [self addSubview:strongcollection];
    
    NSDictionary *views = @{@"blur":blur, @"border":border, @"col":strongcollection};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[blur]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[border]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[blur]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[border(1)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notifiedupdatemenu:) name:notmenuchanged object:nil];
    
    return self;
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark notified

-(void)notifiedupdatemenu:(NSNotification*)notification
{
    [self.collection reloadData];
}

#pragma mark -
#pragma mark col del

-(CGFloat)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return (self.bounds.size.width - 180) / 2;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)col
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView*)col numberOfItemsInSection:(NSInteger)section
{
    return [self.sections count];
}

-(UICollectionViewCell*)collectionView:(UICollectionView*)col cellForItemAtIndexPath:(NSIndexPath*)index
{
    vmenucel *cel = [col dequeueReusableCellWithReuseIdentifier:celid forIndexPath:index];
    [cel config:[self.sections item:index.item]];
    
    return cel;
}

-(BOOL)collectionView:(UICollectionView*)col shouldSelectItemAtIndexPath:(NSIndexPath*)index
{
    BOOL selectable = NO;
    id<msectionprotocol> item = [self.sections item:index.item];
    
    if(![item current])
    {
        selectable = [item available];
    }
    
    return selectable;
}

-(void)collectionView:(UICollectionView*)col didSelectItemAtIndexPath:(NSIndexPath*)index
{
    [[cmain singleton] opensection:[self.sections item:index.item] animated:YES];
}

@end