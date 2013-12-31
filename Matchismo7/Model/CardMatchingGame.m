//
//  CardMatchingGame.m
//  Matchismo7
//
//  Created by Ehab Hamdy on 12/23/13.
//  Copyright (c) 2013 Ehab Hamdy. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()

@property(strong, nonatomic) NSMutableArray *cards; // of Card
@property(nonatomic) int score;


@end

@implementation CardMatchingGame

- (NSMutableArray *)cards
{
    if(!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

- (instancetype)initWithCardCount:(NSUInteger)count
               usingDeck:(Deck *)deck
{
    self = [super init];
    
    if (self) {
        for (int i = 0; i < count; i++) {
            Card *card = [deck drawRandomCard];
            if (!card) {
                self = nil;
            }else{
                [self.cards addObject:card];
            }
        }
    }
    
    return self;
}

- (Card *)cardAtIndex:(NSUInteger)index
{
    return (index < [self.cards count] ) ? self.cards[index] : nil;
}


#define MATCH_BONUS 4
#define MISSMATCH_PENALTY 2
#define FLIP_COST 1

- (void) chooseCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index];
    if(!card.isMatched){
        if(!card.isChosen){
            for (Card *otherCard in self.cards) {
                if(otherCard.isChosen && !otherCard.isMatched){
                    int matchScore = [card match:@[otherCard]];
                    if (matchScore) {
                        otherCard.matched = YES;
                        card.matched = YES;
                        self.score += matchScore * MATCH_BONUS;
                       
                    }else{
                        otherCard.chosen = NO;
                        self.score -= MISSMATCH_PENALTY;
                        
                    }
                    break;
                }
                
            }
            self.score -= FLIP_COST;
            card.chosen = !card.isChosen;
        }
    }

}

- (void) reset
{
    self.score = 0;
    self.matchSummary = @"------------------------";
    for(Card *card in self.cards)
    {
        card.chosen = NO;
        card.matched = NO;
    }
}



@end
