//
//  ViewController.m
//  TwoPlayersMathGame
//
//  Created by Larry Luk on 2017-11-06.
//  Copyright © 2017 App App Studio. All rights reserved.
//

#import "ViewController.h"
#import "Player.h"
#import "GameModel.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UILabel *player1Score;
@property (weak, nonatomic) IBOutlet UILabel *player2Score;
@property (weak, nonatomic) IBOutlet UILabel *inputLabel;
@property (nonatomic, strong) NSArray<Player*>*players;
@property (nonatomic, assign) NSUInteger currentPlayerIndex;
@property (nonatomic) GameModel *gameModel;
@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  [self createPlayers];
  
  self.gameModel = [[GameModel alloc]init];
  [self displayPlayersScore];
  [self updateGame];
  
  self.currentPlayerIndex = 0;
}

- (void)createPlayers {
  Player *player1 = [[Player alloc]init];
  Player *player2 = [[Player alloc]init];
  self.players = @[player1, player2];
}

- (void)displayPlayersScore {
  self.player1Score.text = [NSString stringWithFormat:@"Player 1 score: %li", self.players[0].playerScore];
  self.player2Score.text = [NSString stringWithFormat:@"Player 2 score: %li", self.players[1].playerScore];
  self.inputLabel.text = @"";
}

- (void)switchPlayers {
  self.currentPlayerIndex = self.currentPlayerIndex == 0 ? 1 : 0;
}

- (IBAction)buttonTapped:(UIButton *)sender {
  NSString *input = [sender titleForState:UIControlStateNormal];
  self.inputLabel.text = [NSString stringWithFormat:@"%@%@", self.inputLabel.text, input];
}

- (NSNumber *)playerID {
  NSNumber *playerID = @(self.currentPlayerIndex + 1);
  return playerID;
}

- (void)updateGame {
  [self.gameModel randomQuestion];
  
  self.questionLabel.text = [NSString stringWithFormat:@"Player %@: %li + %li?", [self playerID], self.gameModel.randomNum1, self.gameModel.randomNum2];
}

- (Player *)currentPlayer {
  return self.players[self.currentPlayerIndex];
}

- (void)checkGameOverState {
  if ([self currentPlayer].playerLives == 0) {
    [self displayPlayersScore];
    UIAlertController * alert = [UIAlertController
                                 alertControllerWithTitle:@"Game Over!"
                                 message:[NSString stringWithFormat:@"Player %@ has depleted all the lives...Play again?",[self playerID]]
                                 preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* yesButton = [UIAlertAction
                                actionWithTitle:@"Yes"
                                style:UIAlertActionStyleDefault
                                handler:^(UIAlertAction * action) {
                                }];
    
    [alert addAction:yesButton];
    
    [self presentViewController:alert animated:YES completion:nil];
    [self createPlayers];
    self.currentPlayerIndex = 0;
  } else {
    [self switchPlayers];
  }
}

- (IBAction)btnEnterPressed {
  
  Player *currentPlayer = [self currentPlayer];
  
  if ([self.inputLabel.text intValue] == self.gameModel.answerNum) {
    currentPlayer.playerScore += 1;
    [self switchPlayers];
  } else {
    currentPlayer.playerLives -= 1;
    [self checkGameOverState];
  }
  
  [self displayPlayersScore];
  [self updateGame];
}


@end
