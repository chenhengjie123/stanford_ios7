//
//  PlayingCardView.h
//  SuperCard
//
//  Created by Hengjie.chj on 14/2/2016.
//  Copyright © 2016 hengjie.chj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayingCardView : UIView

@property (nonatomic) NSUInteger rank;
@property (strong, nonatomic) NSString *suit;
@property (nonatomic) BOOL faceUp;

- (void) pinch: (UIPinchGestureRecognizer *)gesture;

@end
