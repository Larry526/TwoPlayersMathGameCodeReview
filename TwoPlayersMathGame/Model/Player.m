//
//  Player.m
//  TwoPlayersMathGame
//
//  Created by Larry Luk on 2017-11-06.
//  Copyright © 2017 App App Studio. All rights reserved.
//

#import "Player.h"

@implementation Player

- (instancetype)init
{
    self = [super init];
    if (self) {
        _playerLives = 3;
        _playerScore = 0;

    }
    return self;
}

@end
