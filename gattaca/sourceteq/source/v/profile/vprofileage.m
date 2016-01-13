#import "vprofileage.h"

@implementation vprofileage
{
    NSInteger celwidth;
    BOOL trackscroll;
}

-(instancetype)init:(cprofileage*)controller
{
    self = [super init:controller];
    [self setBackgroundColor:[UIColor clearColor]];
    
    trackscroll = NO;
    vblur *blur = [vblur light];
    celwidth = 40;
    NSInteger celheight = 54;
    
    UIButton *btnaccept = [[UIButton alloc] init];
    [btnaccept setBackgroundColor:colormain];
    [btnaccept setClipsToBounds:YES];
    [btnaccept setTitle:NSLocalizedString(@"profile_age_btnaccept", nil) forState:UIControlStateNormal];
    [btnaccept setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btnaccept setTitleColor:[UIColor colorWithWhite:1 alpha:0.1] forState:UIControlStateHighlighted];
    [btnaccept.titleLabel setFont:[UIFont fontWithName:fontboldname size:16]];
    [btnaccept.layer setCornerRadius:3];
    [btnaccept setTranslatesAutoresizingMaskIntoConstraints:NO];
    [btnaccept addTarget:self action:@selector(actionaccept) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *lbl = [[UILabel alloc] init];
    [lbl setBackgroundColor:[UIColor clearColor]];
    [lbl setUserInteractionEnabled:NO];
    [lbl setTextAlignment:NSTextAlignmentCenter];
    [lbl setFont:[UIFont fontWithName:fontname size:28]];
    [lbl setTextColor:[UIColor colorWithWhite:0 alpha:0.7]];
    [lbl setText:NSLocalizedString(@"profile_age_lbldescr", nil)];
    [lbl setNumberOfLines:0];
    [lbl setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    [flow setFooterReferenceSize:CGSizeZero];
    [flow setHeaderReferenceSize:CGSizeZero];
    [flow setItemSize:CGSizeMake(celwidth, celheight)];
    [flow setMinimumInteritemSpacing:0];
    [flow setMinimumLineSpacing:0];
    [flow setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    
    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flow];
    [collection setClipsToBounds:YES];
    [collection setBackgroundColor:[UIColor clearColor]];
    [collection setShowsHorizontalScrollIndicator:NO];
    [collection setShowsVerticalScrollIndicator:NO];
    [collection setAlwaysBounceHorizontal:YES];
    [collection setDataSource:self];
    [collection setDelegate:self];
    [collection registerClass:[vprofileagecel class] forCellWithReuseIdentifier:celid];
    [collection setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.collection = collection;
    
    [self addSubview:blur];
    [self addSubview:lbl];
    [self addSubview:btnaccept];
    [self addSubview:collection];
    
    NSDictionary *views = @{@"blur":blur, @"btn":btnaccept, @"col":collection, @"lbl":lbl};
    NSDictionary *metrics = @{@"colheight":@(celheight)};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[blur]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[blur]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[btn]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[lbl]-40-[col(colheight)]-240-[btn(36)]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[lbl]-20-|" options:0 metrics:metrics views:views]];
    
    self.ages = [[mmyprofileages alloc] init];
    
    NSInteger current = self.ages.current;
    [self chooseage:current];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_MSEC * 300), dispatch_get_main_queue(),
                   ^(void)
                   {
                       [self.collection selectItemAtIndexPath:[NSIndexPath indexPathForItem:current inSection:0] animated:NO scrollPosition:UICollectionViewScrollPositionCenteredHorizontally];
                   });
    
    return self;
}

#pragma mark actions

-(void)actionaccept
{
    [(cprofileage*)self.controller selectage:0];
}

#pragma mark functionality

-(void)chooseage:(NSInteger)index
{
    self.current = [self.ages item:index];
}

#pragma mark -
#pragma mark col del

-(void)scrollViewWillBeginDragging:(UIScrollView*)drag
{
    trackscroll = YES;
}

-(void)scrollViewDidEndDecelerating:(UIScrollView*)scroll
{
    trackscroll = NO;
}

-(void)scrollViewDidScroll:(UIScrollView*)scroll
{
    if(trackscroll)
    {
        CGFloat leftoffset = scroll.contentOffset.x;
        
        CGPoint point = CGPointMake(leftoffset + (scroll.bounds.size.width / 2), scroll.bounds.size.height / 2);
        NSIndexPath *index = [self.collection indexPathForItemAtPoint:point];
        
        if(index)
        {
            [self chooseage:index.item];
            [self.collection selectItemAtIndexPath:index animated:YES scrollPosition:UICollectionViewScrollPositionNone];
        }
    }
}

-(UIEdgeInsets)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout insetForSectionAtIndex:(NSInteger)section
{
    CGFloat hrmargin = (self.bounds.size.width - celwidth) / 2;
    
    return UIEdgeInsetsMake(0, hrmargin, 0, hrmargin);
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)col
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView*)col numberOfItemsInSection:(NSInteger)section
{
    return [self.ages count];
}

-(UICollectionViewCell*)collectionView:(UICollectionView*)col cellForItemAtIndexPath:(NSIndexPath*)index
{
    vprofileagecel *cel = [col dequeueReusableCellWithReuseIdentifier:celid forIndexPath:index];
    [cel config:[self.ages item:index.item]];
    
    return cel;
}

-(void)collectionView:(UICollectionView*)col didSelectItemAtIndexPath:(NSIndexPath*)index
{
    [self.collection scrollToItemAtIndexPath:index atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    [self chooseage:index.item];
    trackscroll = NO;
}

@end