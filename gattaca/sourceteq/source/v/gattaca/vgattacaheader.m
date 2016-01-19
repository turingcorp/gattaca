#import "vgattacaheader.h"

@implementation vgattacaheader

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setUserInteractionEnabled:NO];
    
    NSDictionary *attrtitle = @{NSFontAttributeName:[UIFont fontWithName:fontboldname size:24], NSForegroundColorAttributeName:colormain};
    NSDictionary *attrdescr = @{NSFontAttributeName:[UIFont fontWithName:fontname size:20], NSForegroundColorAttributeName:[UIColor colorWithWhite:0 alpha:0.7]};
    
    NSMutableAttributedString *mut = [[NSMutableAttributedString alloc] init];
    [mut appendAttributedString:[[NSAttributedString alloc] initWithString:NSLocalizedString(@"gattaca_main_title", nil) attributes:attrtitle]];
    [mut appendAttributedString:[[NSAttributedString alloc] initWithString:@"\n" attributes:attrtitle]];
    [mut appendAttributedString:[[NSAttributedString alloc] initWithString:NSLocalizedString(@"gattaca_main_descr", nil) attributes:attrdescr]];
    
    UILabel *lbl = [[UILabel alloc] init];
    [lbl setBackgroundColor:[UIColor clearColor]];
    [lbl setNumberOfLines:0];
    [lbl setAttributedText:mut];
    [lbl setTranslatesAutoresizingMaskIntoConstraints:NO];
    [lbl setTextAlignment:NSTextAlignmentCenter];
    
    [self addSubview:lbl];
    
    NSDictionary *views = @{@"lbl":lbl};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[lbl]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[lbl]-50-|" options:0 metrics:metrics views:views]];
    
    return self;
}

@end