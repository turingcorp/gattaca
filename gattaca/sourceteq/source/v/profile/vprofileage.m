#import "vprofileage.h"

@implementation vprofileage
{
    NSInteger celwidth;
    NSInteger verticalmargin;
}

-(instancetype)init:(cprofileage*)controller
{
    self = [super init:controller];
    [self setBackgroundColor:[UIColor clearColor]];
    
    vblur *blur = [vblur light];
    celwidth = 100;
    verticalmargin = 20;
    NSInteger celheight = 50;
    NSInteger colheight = celheight + (verticalmargin * 2);
    
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
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    [flow setFooterReferenceSize:CGSizeZero];
    [flow setHeaderReferenceSize:CGSizeZero];
    [flow setItemSize:CGSizeMake(celwidth, celheight)];
    [flow setMinimumInteritemSpacing:0];
    [flow setMinimumLineSpacing:0];
    [flow setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    
    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flow];
    [collection setClipsToBounds:YES];
    [collection setBackgroundColor:[UIColor redColor]];
    [collection setShowsHorizontalScrollIndicator:NO];
    [collection setShowsVerticalScrollIndicator:NO];
    [collection setAlwaysBounceHorizontal:YES];
    [collection setDataSource:self];
    [collection setDelegate:self];
    [collection registerClass:[vprofileagecel class] forCellWithReuseIdentifier:celid];
    [collection setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self addSubview:blur];
    [self addSubview:btnaccept];
    [self addSubview:collection];
    
    NSDictionary *views = @{@"blur":blur, @"btn":btnaccept, @"col":collection};
    NSDictionary *metrics = @{@"colheight":@(colheight)};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[blur]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[blur]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[btn]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[col(colheight)]-20-[btn(36)]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    
    self.ages = [[mmyprofileages alloc] init];
    
    return self;
}

#pragma mark actions

-(void)actionaccept
{
    [(cprofileage*)self.controller selectage:0];
}

#pragma mark -
#pragma mark col del

-(UIEdgeInsets)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout insetForSectionAtIndex:(NSInteger)section
{
    CGFloat hrmargin = (self.bounds.size.width - celwidth) / 2;
    
    return UIEdgeInsetsMake(verticalmargin, hrmargin, verticalmargin, hrmargin);
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

@end