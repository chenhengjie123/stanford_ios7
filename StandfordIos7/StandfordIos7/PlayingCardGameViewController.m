//
//  PlayingCardGameViewController.m
//  StandfordIos7
//
//  Created by hengjie chen on 12/2/2016.
//  Copyright © 2016 hengjie.chj. All rights reserved.
//

#import "PlayingCardGameViewController.h"
#import "PlayingCardDeck.h"

@interface PlayingCardGameViewController ()

@end

@implementation PlayingCardGameViewController

- (Deck *)createDeck{
    return [[PlayingCardDeck alloc] init];
}

@end
