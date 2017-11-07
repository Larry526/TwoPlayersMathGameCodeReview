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
@property (weak, nonatomic) IBOutlet UILabel *currentInput;

@property (assign, nonatomic) NSInteger userInput;
@property (assign, nonatomic) NSInteger existingInput;
@property (weak, nonatomic) NSString *tempExistingInout;
@property (assign,nonatomic) BOOL player1Turn;

@property (nonatomic) Player *player1;
@property (nonatomic) Player *player2;
@property (nonatomic) GameModel *gameModel;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.view.backgroundColor = [UIColor grayColor];
    
    self.player1 = [[Player alloc]init];
    self.player2 = [[Player alloc]init];
    self.gameModel = [[GameModel alloc]init];
    self.player1Score.text = [NSString stringWithFormat:@"Player 1 score: %li", self.player1.playerScore];
    self.player2Score.text = [NSString stringWithFormat:@"Player 2 score: %li", self.player2.playerScore];
    [self.gameModel randomQuestion];
    self.questionLabel.text = [NSString stringWithFormat:@"Player 1: %li + %li?", self.gameModel.randomNum1, self.gameModel.randomNum2];
    self.player1Turn = YES;

}



- (IBAction)btn1Pressed:(id)sender {
    self.userInput = 1;
    self.tempExistingInout = [NSString stringWithFormat:@"%ld%ld",self.existingInput,self.userInput];
    self.existingInput = [self.tempExistingInout intValue];
    self.currentInput.text = [NSString stringWithFormat:@"%ld",self.existingInput];
}

- (IBAction)btn2Pressed:(id)sender {
    self.userInput = 2;
    self.tempExistingInout = [NSString stringWithFormat:@"%ld%ld",self.existingInput,self.userInput];
    self.existingInput = [self.tempExistingInout intValue];
    self.currentInput.text = [NSString stringWithFormat:@"%ld",self.existingInput];

}

- (IBAction)btn3Pressed:(id)sender {
    self.userInput = 3;
    self.tempExistingInout = [NSString stringWithFormat:@"%ld%ld",self.existingInput,self.userInput];
    self.existingInput = [self.tempExistingInout intValue];
    self.currentInput.text = [NSString stringWithFormat:@"%ld",self.existingInput];

}

- (IBAction)btn4Pressed:(id)sender {
    self.userInput = 4;
    self.tempExistingInout = [NSString stringWithFormat:@"%ld%ld",self.existingInput,self.userInput];
    self.existingInput = [self.tempExistingInout intValue];
    self.currentInput.text = [NSString stringWithFormat:@"%ld",self.existingInput];

}

- (IBAction)btn5Pressed:(id)sender {
    self.userInput = 5;
    self.tempExistingInout = [NSString stringWithFormat:@"%ld%ld",self.existingInput,self.userInput];
    self.existingInput = [self.tempExistingInout intValue];
    self.currentInput.text = [NSString stringWithFormat:@"%ld",self.existingInput];

}

- (IBAction)btn6Pressed:(id)sender {
    self.userInput = 6;
    self.tempExistingInout = [NSString stringWithFormat:@"%ld%ld",self.existingInput,self.userInput];
    self.existingInput = [self.tempExistingInout intValue];
    self.currentInput.text = [NSString stringWithFormat:@"%ld",self.existingInput];

}

- (IBAction)btn7Pressed:(id)sender {
    self.userInput = 7;
    self.tempExistingInout = [NSString stringWithFormat:@"%ld%ld",self.existingInput,self.userInput];
    self.existingInput = [self.tempExistingInout intValue];
    self.currentInput.text = [NSString stringWithFormat:@"%ld",self.existingInput];

}

- (IBAction)btn8Pressed:(id)sender {
    self.userInput = 8;
    self.tempExistingInout = [NSString stringWithFormat:@"%ld%ld",self.existingInput,self.userInput];
    self.existingInput = [self.tempExistingInout intValue];
    self.currentInput.text = [NSString stringWithFormat:@"%ld",self.existingInput];

}

- (IBAction)btn9Pressed:(id)sender {
    self.userInput = 9;
    self.tempExistingInout = [NSString stringWithFormat:@"%ld%ld",self.existingInput,self.userInput];
    self.existingInput = [self.tempExistingInout intValue];
    self.currentInput.text = [NSString stringWithFormat:@"%ld",self.existingInput];

}

- (IBAction)btn0Pressed:(id)sender {
    self.userInput = 0;
    self.tempExistingInout = [NSString stringWithFormat:@"%ld%ld",self.existingInput,self.userInput];
    self.existingInput = [self.tempExistingInout intValue];
    self.currentInput.text = [NSString stringWithFormat:@"%ld",self.existingInput];

}

- (IBAction)btnEnterPressed:(id)sender {
    if (self.player1Turn == YES) {
        
        
        if (self.existingInput == self.gameModel.answerNum) {
            self.player1.playerScore += 1;
            self.player1Score.text = [NSString stringWithFormat:@"Player 1 score: %li", self.player1.playerScore];
            self.player1Turn = NO;
            [self.gameModel randomQuestion];
            self.questionLabel.text = [NSString stringWithFormat:@"Player 2: %li + %li?", self.gameModel.randomNum1, self.gameModel.randomNum2];
            
            
        } else {
            self.player1.playerLives -=1;
            if (self.player1.playerLives == 0) {
                
                UIAlertController * alert = [UIAlertController
                                             alertControllerWithTitle:@"Game Over!"
                                             message:@"Player 1 has depleted all the lives...Play again?"
                                             preferredStyle:UIAlertControllerStyleAlert];
                
                
                
                UIAlertAction* yesButton = [UIAlertAction
                                            actionWithTitle:@"Yes"
                                            style:UIAlertActionStyleDefault
                                            handler:^(UIAlertAction * action) {
                                            }];
                
                [alert addAction:yesButton];
                
                [self presentViewController:alert animated:YES completion:nil];
                self.questionLabel.text = [NSString stringWithFormat:@"Player 1: %li + %li?", self.gameModel.randomNum1, self.gameModel.randomNum2];
                self.player1.playerLives = 3;
                self.player2.playerLives = 3;
                self.player1.playerScore = 0;
                self.player2.playerScore = 0;
                self.player1Score.text = [NSString stringWithFormat:@"Player 1 score: %li", self.player1.playerScore];
                self.player2Score.text = [NSString stringWithFormat:@"Player 2 score: %li", self.player2.playerScore];
                
                
            } else {
                self.player1Turn = NO;
                self.questionLabel.text = [NSString stringWithFormat:@"Player 2: %li + %li?", self.gameModel.randomNum1, self.gameModel.randomNum2];
                
                
            }
            
        }
        
        self.existingInput = 0;
        self.currentInput.text = @"";
        
        
    } else {
        
        
        
        if (self.existingInput == self.gameModel.answerNum) {
            self.player2.playerScore += 1;
            self.player2Score.text = [NSString stringWithFormat:@"Player 2 score: %li", self.player1.playerScore];
            self.player1Turn = YES;
            [self.gameModel randomQuestion];
            self.questionLabel.text = [NSString stringWithFormat:@"Player 1: %li + %li?", self.gameModel.randomNum1, self.gameModel.randomNum2];
            
            
        } else {
            self.player2.playerLives -=1;
            if (self.player2.playerLives == 0) {
                
                UIAlertController * alert = [UIAlertController
                                             alertControllerWithTitle:@"Game Over!"
                                             message:@"Player 2 has depleted all the lives...Play again?"
                                             preferredStyle:UIAlertControllerStyleAlert];
                
                
                
                UIAlertAction* yesButton = [UIAlertAction
                                            actionWithTitle:@"Yes"
                                            style:UIAlertActionStyleDefault
                                            handler:^(UIAlertAction * action) {
                                            }];
                
                [alert addAction:yesButton];
                
                [self presentViewController:alert animated:YES completion:nil];
                self.questionLabel.text = [NSString stringWithFormat:@"Player 1: %li + %li?", self.gameModel.randomNum1, self.gameModel.randomNum2];
                self.player1.playerLives = 3;
                self.player2.playerLives = 3;
                self.player1.playerScore = 0;
                self.player2.playerScore = 0;
                self.player1Score.text = [NSString stringWithFormat:@"Player 1 score: %li", self.player1.playerScore];
                self.player2Score.text = [NSString stringWithFormat:@"Player 2 score: %li", self.player2.playerScore];
                self.player1Turn = YES;
                
            } else {
                self.player1Turn = YES;
                self.questionLabel.text = [NSString stringWithFormat:@"Player 1: %li + %li?", self.gameModel.randomNum1, self.gameModel.randomNum2];
                
                
            }
            
        }
        
        self.existingInput = 0;
        self.currentInput.text = @"";
        
        
        
    }
}

@end
