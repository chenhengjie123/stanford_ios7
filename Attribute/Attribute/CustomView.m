//
//  CustomView.m
//  Attribute
//
//  Created by Hengjie.chj on 14/2/2016.
//  Copyright © 2016 hengjie chen. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView

- (void)drawRect:(CGRect)rect{
//    CGContextRef aRef = UIGraphicsGetCurrentContext();
//    CGContextSaveGState(aRef);
    
    UIBezierPath *roundedRectPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:5.0f];
    roundedRectPath.lineWidth = 1;
    [[UIColor redColor] setStroke];
    [[UIColor greenColor] setFill];
    
    [roundedRectPath addClip];
    [roundedRectPath stroke];
    [roundedRectPath fill];

    
//    CGContextRestoreGState(aRef);
}

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
