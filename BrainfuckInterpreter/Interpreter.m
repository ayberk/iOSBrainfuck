//
//  Interpreter.m
//  BrainfuckInterpreter
//
//  Created by Ayberk Yilmaz on 10/17/12.
//  Copyright (c) 2012 Ayberk Yilmaz. All rights reserved.
//

#import "Interpreter.h"

#define BUFFER_LEN 256

@interface Interpreter()

@end

@implementation Interpreter

@synthesize inputCode = _inputCode;
@synthesize outputText = _outputText;
@synthesize inputConsole = _inputConsole;

-(void)process
{
    if(!_outputText)
        _outputText = [NSMutableString string];
    else
        _outputText = [NSMutableString stringWithFormat:@""];
    
    char program[BUFFER_LEN];
    memset(program,0,sizeof(program));
    char *buffer = program;
    
    int inputIndex = 0;
    char c;
    for(int i = 0; i < [self.inputCode length]; i++)
    {
        c = [self.inputCode characterAtIndex:i];
        NSLog(@"c === %c buffer == %d",c,*buffer);
        switch (c) {
            case '+':
                (*buffer)++;
                break;
            case '-':
                (*buffer)--;
                break;
            case '>':
                buffer++;
                break;
            case '<':
                buffer--;
                break;
            case '.':
                [_outputText appendFormat:@"%c",*buffer];
            case ',':
                *buffer = [_inputConsole characterAtIndex:inputIndex++];
                break;
            default:
                break;
        }
    }
    
}

@end
