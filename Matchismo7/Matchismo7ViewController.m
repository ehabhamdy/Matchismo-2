//
//  Matchismo7ViewController.m
//  Matchismo7
//
//  Created by Ehab Hamdy on 12/22/13.
//  Copyright (c) 2013 Ehab Hamdy. All rights reserved.
//

#import "Matchismo7ViewController.h"
#import "CardMatchingGame.h"

@interface Matchismo7ViewController ()
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (nonatomic) int flipCount;
@property (nonatomic, strong) Deck *card;
@property (nonatomic, strong) CardMatchingGame *game;
@end

@implementation Matchismo7ViewController


-(CardMatchingGame *) game{
    if(!_game) _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                                         usingDeck:[self createDeck]];
    return _game;
}

-(Deck *) card{
    if (!_card) _card = [self createDeck] ;
    return _card;
}

- (Deck *) createDeck{
    return [[PlayingCardDeck alloc] init];
}


- (IBAction)touchCardButton:(UIButton *)sender {
    
    NSUInteger cardIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:cardIndex];
    [self updateUI];
    
    
}


- (void)updateUI{
    for (UIButton *cardButton in self.cardButtons) {
        NSUInteger cardIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card]
                              forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
}

- (NSString *)titleForCard:(Card *)card{
    return card.isChosen ? card.contents : @"";
}

- (UIImage *)backgroundImageForCard:(Card *) card{
    
    return [UIImage imageNamed:card.isChosen ? @"cardfront": @"cardback"];
}

@end
