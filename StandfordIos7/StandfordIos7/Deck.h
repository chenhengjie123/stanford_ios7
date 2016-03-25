//
//  Deck.h
//  StandfordIos7
//
//  Created by Hengjie.chj on 4/2/2016.
//  Copyright © 2016 hengjie.chj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject


- (void)addCard:(Card *)card atTop:(BOOL)atTop;
- (void)addCard:(Card *)card;

- (Card *)drawRandomCard;

@end
