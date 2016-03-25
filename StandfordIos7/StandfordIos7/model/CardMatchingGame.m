//
//  CardMachingGame.m
//  StandfordIos7
//
//  Created by Hengjie.chj on 5/2/2016.
//  Copyright © 2016 hengjie.chj. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame ()
@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic) NSMutableArray *cards;
@property (nonatomic) NSMutableArray *chosenCards;
@end

@implementation CardMatchingGame

- (NSMutableArray *)cards{
    if (!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

- (NSInteger) matchCount{
    if (!_matchCount){
        _matchCount = 2;
    }
    return _matchCount;
}

- (instancetype) initWithCardCount:(NSUInteger)count
                         usingDeck:(Deck *)deck{
    self = [super init];
    
    if (self){
        for(int i = 0; i < count; i++){
            Card *card = [deck drawRandomCard];
            if (card) {
                [self.cards addObject:card];
            } else {
                self = nil;
                break;
            }
        }
    }
    
    return self;
}

static const int COST_TO_CHOOSE = 1;
static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;

- (void) chooseCardAtIndex:(NSUInteger)index{
    Card *card = [self cardAtIndex:index];
    
    if (!card.isMatched){
        if (card.isChosen){
            card.chosen = NO;
            [self.chosenCards removeObject:card];
        } else {
            
            if ([self.chosenCards count] + 1 >= self.matchCount){
                
                // match against cards
                int matchScore = [card match:self.chosenCards];
                if (matchScore) {
                    self.score += matchScore * MATCH_BONUS;
                    NSLog(@"%@ and %@ matched. Score: %d + %d = %d", card.contents, [self chosenCardContents], self.score - matchScore * MATCH_BONUS, matchScore * MATCH_BONUS, self.score);
                    for (Card *matchedCards in self.chosenCards){
                        matchedCards.matched = YES;
                    }
                    card.matched = YES;
                } else {
                    self.score -= MISMATCH_PENALTY;
                    NSLog(@"%@ and %@ mismatched. Score: %d - %d = %d", card.contents, [self chosenCardContents], self.score+MISMATCH_PENALTY, MISMATCH_PENALTY, self.score);
                    for (Card *matchedCards in self.chosenCards){
                        matchedCards.chosen = NO;
                    }
                }
                self.chosenCards = nil;
            }
            
            self.score -= COST_TO_CHOOSE;
            NSLog(@"%@ is chosen. Score: %d - %d = %d", card.contents, self.score + COST_TO_CHOOSE, COST_TO_CHOOSE, self.score);
            card.chosen = YES;
            if (!card.isMatched){
                [self.chosenCards addObject:card];
            }
        }
    }
}

- (NSMutableArray *) chosenCards{
    if (!_chosenCards) {
        _chosenCards = [[NSMutableArray alloc] init];
    }
    return _chosenCards;
}

- (NSMutableString *) chosenCardContents {
    NSMutableString *chosenCardContents = [NSMutableString stringWithFormat:@""];
    for (Card *card in self.chosenCards){
        [chosenCardContents appendFormat:@"%@, ", card.contents];
    }
    [chosenCardContents deleteCharactersInRange:NSMakeRange([chosenCardContents length]-2, 2)];
    return chosenCardContents;
    
}

- (Card *)cardAtIndex:(NSUInteger)index{
    return index < [self.cards count] ? self.cards[index] : nil;
}

@end
