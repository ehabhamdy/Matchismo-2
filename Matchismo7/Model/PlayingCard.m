//
//  PlayingCard.m
//  Matchismo7
//
//  Created by Ehab Hamdy on 12/23/13.
//  Copyright (c) 2013 Ehab Hamdy. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

- (int) match:(NSArray *)otherCards
{
    int score = 0;
    
    if (otherCards.count == 1) {
        id otherCard = [otherCards lastObject];
        if ([otherCard isKindOfClass:[PlayingCard class]]) {
            PlayingCard *otherPlayingCard = (PlayingCard *) otherCard;
            if([otherPlayingCard.suit isEqualToString:self.suit])
                score = 1;
            else if (otherPlayingCard.rank == self.rank)
                score = 4;
        }
    }
    
    return score;
}

@synthesize suit = _suit; // Because we provide setter and getter

- (NSString *) contents{
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

+ (NSArray *) validSuits{
    return @[@"♥", @"♦", @"♠", @"♣"];
}
+ (NSArray *) rankStrings{
    return @[@"?", @"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
}

- (void)setRank:(NSUInteger)rank{
    if(rank <= [PlayingCard maxRank]){
        _rank = rank;
    }
}

- (void) setSuit:(NSString *)suit{
    if ( [[PlayingCard validSuits] containsObject:suit] ) {
        _suit = suit;
    }
    
}

- (NSString *) suit{
    return _suit ? _suit : @"?";
}

+ (NSUInteger) maxRank{
    return [[self rankStrings] count]-1 ;
}

@end
