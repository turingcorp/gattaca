#import "vmenu.h"

@implementation vmenu

+(void)addto:(UIView*)view
{
    vmenu *menu = [[vmenu alloc] init];
    
    [view addSubview:menu];
    NSDictionary *views = @{@"menu":menu};
    NSDictionary *metrics = @{};
    
    [view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[menu]-0-|" options:0 metrics:metrics views:views]];
    [view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[menu(62)]-0-|" options:0 metrics:metrics views:views]];
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
    
    [self addSubview:blur];
    [self addSubview:border];
    
    NSDictionary *views = @{@"blur":blur, @"border":border};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[blur]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[border]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[blur]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[border(1)]" options:0 metrics:metrics views:views]];
    
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
    return [self.sections count];
}

-(UICollectionViewCell*)collectionView:(UICollectionView*)col cellForItemAtIndexPath:(NSIndexPath*)index
{
    vmenucel *cel = [col dequeueReusableCellWithReuseIdentifier:celid forIndexPath:index];
    [cel config:[self.sections item:index.item]];
    
    return cel;
}

@end