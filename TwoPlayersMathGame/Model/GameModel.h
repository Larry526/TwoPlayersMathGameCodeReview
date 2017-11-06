//
//  GameModel.h
//  TwoPlayersMathGame
//
//  Created by Larry Luk on 2017-11-06.
//  Copyright © 2017 App App Studio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameModel : NSObject

@property (nonatomic, assign) NSInteger randomNum1;
@property (nonatomic, assign) NSInteger randomNum2;
@property (nonatomic, assign) NSInteger answerNum;

- (void) randomQuestion;

@end
