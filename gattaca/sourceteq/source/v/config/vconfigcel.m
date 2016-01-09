#import "vconfigcel.h"

@implementation vconfigcel
{
    NSDictionary *attrtitle;
    NSDictionary *attrdescr;
    NSDictionary *attrtitlehl;
    NSDictionary *attrdescrhl;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    
    UILabel *stronglbl = [[UILabel alloc] init];
    [stronglbl setBackgroundColor:[UIColor clearColor]];
    [stronglbl setTranslatesAutoresizingMaskIntoConstraints:NO];
    [stronglbl setNumberOfLines:0];
    [stronglbl setUserInteractionEnabled:NO];
    self.lbl = stronglbl;
    
    UIView *strongcolor = [[UIView alloc] init];
    [strongcolor setUserInteractionEnabled:NO];
    [strongcolor setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.color = strongcolor;
    
    attrtitle = @{NSFontAttributeName:[UIFont fontWithName:fontboldname size:18], NSForegroundColorAttributeName:[UIColor colorWithWhite:0 alpha:0.8]};
    attrdescr = @{NSFontAttributeName:[UIFont fontWithName:fontname size:14], NSForegroundColorAttributeName:[UIColor colorWithWhite:0 alpha:0.5]};
    
    attrtitlehl = @{NSFontAttributeName:[UIFont fontWithName:fontboldname size:18], NSForegroundColorAttributeName:[UIColor whiteColor]};
    attrdescrhl = @{NSFontAttributeName:[UIFont fontWithName:fontname size:14], NSForegroundColorAttributeName:[UIColor colorWithWhite:1 alpha:0.7]};
    
    [self addSubview:stronglbl];
    [self addSubview:strongcolor];
    
    NSDictionary *views = @{@"lbl":stronglbl, @"color":strongcolor};
    NSDictionary *metrics = @{};
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[lbl]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[color]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[lbl]-0-[color(1)]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

-(void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    [self hover];
}

-(void)setHighlighted:(BOOL)highlighted
{
    [super setHighlighted:highlighted];
    [self hover];
}

#pragma mark functionality

-(void)hover
{
    NSDictionary *fortitle;
    NSDictionary *fordescr;
    
    if(self.isSelected || self.isHighlighted)
    {
        fortitle = attrtitlehl;
        fordescr = attrdescrhl;
        [self setBackgroundColor:[self.item color]];
    }
    else
    {
        fortitle = attrtitle;
        fordescr = attrdescr;
        [self setBackgroundColor:[UIColor clearColor]];
    }
    
    NSMutableAttributedString *mut = [[NSMutableAttributedString alloc] init];
    [mut appendAttributedString:[[NSAttributedString alloc] initWithString:[self.item title] attributes:fortitle]];
    [mut appendAttributedString:[[NSAttributedString alloc] initWithString:@"\n" attributes:fordescr]];
    [mut appendAttributedString:[[NSAttributedString alloc] initWithString:[self.item descr] attributes:fordescr]];
    
    [self.lbl setAttributedText:mut];
}

#pragma mark public

-(void)config:(id<mconfigprotocol>)item
{
    self.item = item;
    [self.color setBackgroundColor:[item color]];
    [self hover];
}

@end