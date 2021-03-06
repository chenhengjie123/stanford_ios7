//
//  PlayingCardView.m
//  SuperCard
//
//  Created by Hengjie.chj on 14/2/2016.
//  Copyright © 2016 hengjie.chj. All rights reserved.
//

#import "PlayingCardView.h"

@implementation PlayingCardView

#pragma mark - Properties

- (void) setSuit:(NSString *)suit{
    _suit = suit;
    [self setNeedsDisplay];
}

- (void) setRank:(NSUInteger)rank{
    _rank = rank;
    [self setNeedsDisplay];
}

- (void) setFaceUp:(BOOL)faceUp{
    _faceUp = faceUp;
    [self setNeedsDisplay];
}

- (void) pinch: (UIPinchGestureRecognizer *)gesture{
    if (gesture.state == UIGestureRecognizerStateChanged || gesture.state == UIGestureRecognizerStateEnded){
        [self setBounds:CGRectMake(0, 0, self.bounds.size.width * gesture.scale, self.bounds.size.height * gesture.scale)];
        gesture.scale = 1.0;
    }
}

#pragma mark - Drawing

#define CORNER_FONT_STANFORD_HEIGHT 100.0
#define CORNER_RADIUS 5.0

- (CGFloat)cornerScaleFactor { return self.bounds.size.height / CORNER_FONT_STANFORD_HEIGHT; }
- (CGFloat)cornerRadius { return CORNER_RADIUS * [self cornerScaleFactor];}
- (CGFloat)cornerOffset { return [self cornerScaleFactor] * 3.0; }

- (void) drawRect:(CGRect)rect{
    UIBezierPath *roundedRect = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:[self cornerRadius]];
    
    [roundedRect addClip];
    [[UIColor whiteColor] setFill];
    UIRectFill(self.bounds);
    
    [[UIColor blackColor] setStroke];
    [roundedRect stroke];
    
    if (self.faceUp){
        [self drawConers];
    } else {
        [[UIImage imageNamed:@"cardback"] drawInRect:self.bounds];
    }
}

- (NSString *) rankAsString{
    return @[@"?", @"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"][self.rank];
}

- (void) drawConers{
    // set pagagraph style
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.alignment = NSTextAlignmentCenter;
    
    // set font
    UIFont *cornerFont = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    cornerFont = [cornerFont fontWithSize:cornerFont.pointSize * [self cornerScaleFactor]];
    
    // set attribute string
    NSAttributedString *cornerText = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@\n%@", self.rankAsString, self.suit] attributes:@{NSFontAttributeName : cornerFont, NSParagraphStyleAttributeName : paragraphStyle}];
    
    // set bounds
    CGRect textBounds;
    textBounds.origin = CGPointMake([self cornerOffset], [self cornerOffset]);
    textBounds.size = [cornerText size];
    
    // draw it
    [cornerText drawInRect:textBounds];
    
    // draw the one in right bottom corner
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, self.bounds.size.width, self.bounds.size.height);
    CGContextRotateCTM(context, M_PI);
    [cornerText drawInRect:textBounds];
}


#pragma mark - Initilazing

- (void) setup{
    self.backgroundColor = nil;
    self.opaque = NO;
    self.contentMode = UIViewContentModeRedraw;
}

- (void) awakeFromNib{
    [self setup];
}



- (id) initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self){
        [self setup];
    }
    return self;
}

@end
