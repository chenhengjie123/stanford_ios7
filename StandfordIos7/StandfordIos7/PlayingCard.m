//
//  PlayingCard.m
//  StandfordIos7
//
//  Created by Hengjie.chj on 4/2/2016.
//  Copyright © 2016 hengjie.chj. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

@synthesize suit = _suit;

- (int)match:(NSArray *)otherCards{
    int score = 0;
    BOOL matchSuit = NO;
    BOOL matchRank = NO;
    
    if ([[otherCards firstObject] isMemberOfClass:[PlayingCard class]]) {
        PlayingCard *firstCard = (PlayingCard *)[otherCards firstObject];
        if ([self.suit isEqualToString:firstCard.suit]) {
            matchSuit = YES;
        } else if (self.rank == firstCard.rank){
            matchRank = YES;
        }
    }
    
    for (id card in otherCards){
        if ([card isMemberOfClass:[PlayingCard class]]) {
            PlayingCard *otherCard = (PlayingCard *)card;
            if (matchSuit && [self.suit isEqualToString:otherCard.suit]){
                score = 1;
            } else if (matchRank && self.rank == otherCard.rank) {
                score = 4;
            } else {
                score = 0;
            }
        }
    }
    
    return score;
}

- (NSString *)contents{
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

+ (NSArray *)validSuits{
    return @[@"♠︎", @"♣︎", @"♥︎", @"♦︎"];
}

- (void)setSuit:(NSString *) suit{
    if ([[PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
        
    }
}

- (NSString *)suit{
    return _suit ? :@"?";
}

+ (NSArray *)rankStrings{
    return @[@"?", @"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
}

+ (NSUInteger)maxRank{ return [[self rankStrings] count]-1; }

- (void) setRank:(NSUInteger)rank {
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}

@end
