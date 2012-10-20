//
//  BFIViewController.h
//  BrainfuckInterpreter
//
//  Created by Ayberk Yilmaz on 10/17/12.
//  Copyright (c) 2012 Ayberk Yilmaz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Interpreter.h"

@interface BFIViewController : UIViewController

@property (nonatomic,weak) IBOutlet UITextField *input;
@property (nonatomic,weak) IBOutlet UITextView *code;
@property (nonatomic,weak) IBOutlet UITextView *output;
@property (nonatomic,strong) Interpreter *interpreter;

- (IBAction)pressed:(UIButton*)sender;

@end
