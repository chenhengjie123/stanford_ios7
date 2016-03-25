//
//  CardMachingGame.h
//  StandfordIos7
//
//  Created by Hengjie.chj on 5/2/2016.
//  Copyright © 2016 hengjie.chj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject

- (instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck;

- (void)chooseCardAtIndex:(NSUInteger) index;
- (Card *)cardAtIndex:(NSUInteger) index;

@property (nonatomic, readonly) NSInteger score;
@property (nonatomic) NSInteger matchCount;

@end
