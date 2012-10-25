//
//  BFIViewController.m
//  BrainfuckInterpreter
//
//  Created by Ayberk Yilmaz on 10/17/12.
//  Copyright (c) 2012 Ayberk Yilmaz. All rights reserved.
//

#import "BFIViewController.h"
#import "Interpreter.h"
#import <QuartzCore/QuartzCore.h>


@interface BFIViewController ()
// private method goes here
@end

@implementation BFIViewController

@synthesize input;
@synthesize code;
@synthesize output;
@synthesize interpreter = _interpreter;

-(Interpreter*)interpreter
{
    if(!_interpreter) {
        _interpreter = [[Interpreter alloc] init];
    }
    
    return _interpreter;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    code.layer.borderWidth = 1.0f;
    code.layer.borderColor = [[UIColor grayColor] CGColor];
    
    [[output layer] setBorderWidth:1.0f];
    output.layer.borderColor = [[UIColor grayColor] CGColor];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pressed:(UIButton*)sender
{
    self.interpreter.inputCode = self.code.text;
    self.interpreter.inputConsole = self.input.text;
    [self.interpreter process];
    self.output.text = self.interpreter.outputText;
}

/* close keyboard when focus is lost */
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [[event allTouches] anyObject];
    if ([code isFirstResponder] && [touch view] != code) {
        [code resignFirstResponder];
    }
    
    if([input isFirstResponder] && [touch view] != input) {
        [input resignFirstResponder];
    }
    [super touchesBegan:touches withEvent:event];
}
@end
