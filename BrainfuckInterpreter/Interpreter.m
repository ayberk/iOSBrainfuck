//
//  Interpreter.m
//  BrainfuckInterpreter
//
//  Created by Ayberk Yilmaz on 10/17/12.
//  Copyright (c) 2012 Ayberk Yilmaz. All rights reserved.
//

#import "Interpreter.h"


@interface Interpreter()

@end

@implementation Interpreter

static int stack[BUFFER_LEN];
static int stackPointer = -1;
static int pc;
static int inputIndex;
static char *buffer;

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
    //NSLog(@"Pushed to stack");
    stackPointer+=1;
    stack[stackPointer] = value;
}

-(int)popStack
{
    if(stackPointer < 0 )
    {
        NSLog(@"Access to empty stack -- match brackets");
        return -1;
    }
    return stack[stackPointer--];
}


-(void)processChar:(char)c
{
    switch (c) {
        case '+':
            (*buffer)++;
            pc++;
            break;
        case '-':
            (*buffer)--;
            pc++;
            break;
        case '>':
            buffer++;
            pc++;
            break;
        case '<':
            buffer--;
            pc++;
            break;
        case '.':
            [_outputText appendFormat:@"%c",*buffer];
            pc++;
            break;
        case ',': 
            if(inputIndex < [_inputConsole length]) {
                *buffer = [_inputConsole characterAtIndex:inputIndex++];
            }
            else {
                *buffer = 0;
            }
            pc++;
            break;
        case '[':
            if(*buffer)
            {
                [self pushStack:pc];
                pc++;
                [self loop];
            }
            else
            {
                char x = [self.inputCode characterAtIndex:pc];
                while ( x != ']') {
                    pc++;
                    x = [self.inputCode characterAtIndex:pc];
                }
                pc++;
            }
            break;
        case ']':
            pc = [self popStack];
            break;
        default:
            pc++;
            break;
    }
    
}

-(void)loop
{
    char x;
    do {
        x = [self.inputCode characterAtIndex:pc];
        [self processChar:x];
    }while (x != ']');
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
    inputIndex = 0;
    
    char c;
    for(pc = 0; pc < [self.inputCode length]; )
    {
        c = [self.inputCode characterAtIndex:pc];
        NSLog(@"c === %c buffer == %d",c,*buffer);
        [self processChar:c ];
    }
}
@end

