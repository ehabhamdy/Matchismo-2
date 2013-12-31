//
//  PlayingCard.h
//  Matchismo7
//
//  Created by Ehab Hamdy on 12/23/13.
//  Copyright (c) 2013 Ehab Hamdy. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (nonatomic, strong) NSString *suit;
@property (nonatomic)  NSUInteger rank;

+ (NSArray *) validSuits;
+ (NSUInteger) maxRank;


@end
