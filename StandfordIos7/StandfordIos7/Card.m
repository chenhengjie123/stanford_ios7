//
//  Card.m
//  StandfordIos7
//
//  Created by Hengjie.chj on 4/2/2016.
//  Copyright © 2016 hengjie.chj. All rights reserved.
//

#import "Card.h"

@interface Card()

@end

@implementation Card

- (int)match:(NSArray *)otherCards{
    int score = 0;
    
    for (Card *card in otherCards) {
        score = [self matchCard:card];
    }
    
    return score;
}

- (int)matchCard:(Card *)otherCard{
    int score = 0;
    
    if ([otherCard.contents isEqualToString:self.contents]) {
        score = 1;
    }
    return score;
}

@end