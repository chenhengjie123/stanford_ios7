//
//  ViewController.m
//  StandfordIos7
//
//  Created by Hengjie.chj on 4/2/2016.
//  Copyright © 2016 hengjie.chj. All rights reserved.
//

#import "CardGameViewController.h"
#import "CardMatchingGame.h"

@interface CardGameViewController ()
@property (nonatomic, strong) CardMatchingGame *game;
@property (nonatomic, strong) Deck *deck;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (nonatomic) NSInteger matchCount;
@end

@implementation CardGameViewController

- (CardMatchingGame *)game{
    if (!_game) _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count] usingDeck:[self createDeck]];
    return _game;
}

-(Deck *)createDeck{
    return nil;
}

- (IBAction)touchModeSwitch:(UISwitch *)sender {
    if ([sender isOn]) {
        self.matchCount = 3;
        
    } else {
        self.matchCount = 2;
    }
    [self.game setMatchCount:self.matchCount];
}

- (IBAction)resetButton:(UIButton *)sender {
    self.game = nil;
    [self.game setMatchCount:self.matchCount];
    [self updateUI];
}

- (IBAction)touchCardButton:(UIButton *)sender {
    int cardIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:cardIndex];
    [self updateUI];
}

- (void) updateUI{
    for (UIButton *cardButton in self.cardButtons) {
        int cardIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundForCard:card ] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
}

- (NSString *) titleForCard: (Card *)card{
    return card.isChosen ? card.contents : nil;
}

- (UIImage *) backgroundForCard: (Card *)card{
    return [UIImage imageNamed:card.isChosen ? @"cardfront" : @"cardback"];
}
@end
