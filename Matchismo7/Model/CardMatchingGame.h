//
//  CardMatchingGame.h
//  Matchismo7
//
//  Created by Ehab Hamdy on 12/23/13.
//  Copyright (c) 2013 Ehab Hamdy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject


// designated initializers
- (instancetype)initWithCardCount:(NSUInteger)cardCount
              usingDeck:(Deck *)deck;

- (void)chooseCardAtIndex:(NSUInteger)index;

- (Card *)cardAtIndex:(NSUInteger)index;

- (void) reset;

@property(nonatomic, readonly) int score;
@property(nonatomic, strong) NSString *matchSummary;



@end
