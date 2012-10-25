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

int stack[BUFFER_LEN];
int stackPointer = -1;
int pc = 0;
int inputIndex = 0;
char *buffer;

@synthesize inputCode = _inputCode;
@synthesize outputText = _outputText;
@synthesize inputConsole = _inputConsole;

-(void)pushStack:(int)value
{
    if(stackPointer >= BUFFER_LEN)
    {
        NSLog(@"Stack overflow");
        return;
    }
    stack[++stackPointer] = value;
}

-(int)popStack
{
    if(stackPointer < 0 )
    {
        NSLog(@"Acess to empty stack");
        return -1;
    }
    return stack[stackPointer--];
}


-(void)processChar:(char)c
{
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
        case '[':
            [self pushStack:pc];
        default:
            break;
    }

}

-(void)process
{
    if(!_outputText)
        _outputText = [NSMutableString string];
    else
        _outputText.string = @"";
    
    char program[BUFFER_LEN];
    memset(program,0,sizeof(program));
    pc = 0;
    buffer = program;
        
    char c;
    for(int i = 0; i < [self.inputCode length]; i++)
    {
        c = [self.inputCode characterAtIndex:i];
        NSLog(@"c === %c buffer == %d",c,*buffer);
        [self processChar:c ];
    }
}
@end

