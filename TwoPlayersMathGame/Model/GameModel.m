//
//  GameModel.m
//  TwoPlayersMathGame
//
//  Created by Larry Luk on 2017-11-06.
//  Copyright © 2017 App App Studio. All rights reserved.
//

#import "GameModel.h"

@implementation GameModel

- (instancetype)init
{
    self = [super init];
    if (self) {

        
    }
    return self;
}

-(void)randomQuestion {
    
    self.randomNum1 = (NSInteger) arc4random_uniform(20) + 1;
    self.randomNum2 = (NSInteger) arc4random_uniform(20) + 1;
    
    self.answerNum = self.randomNum1 + self.randomNum2;

    
}

@end
