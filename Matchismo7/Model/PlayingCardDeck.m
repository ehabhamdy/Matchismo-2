//
//  PlayingCardDeck.m
//  Matchismo7
//
//  Created by Ehab Hamdy on 12/23/13.
//  Copyright (c) 2013 Ehab Hamdy. All rights reserved.
//

#import "PlayingCardDeck.h"

@implementation PlayingCardDeck

-(instancetype) init
{
    self = [super init];
    if (self){
        for (NSString *suit in [PlayingCard validSuits]) {
            for (NSUInteger rank = 1; rank <= [PlayingCard maxRank]; rank++) {
                PlayingCard *card = [[PlayingCard alloc]init];
                card.rank = rank;
                card.suit = suit;
                [self addCard:card];
            }
        }
        
    }
    return self;
}

@end
