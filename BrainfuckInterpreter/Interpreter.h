//
//  Interpreter.h
//  BrainfuckInterpreter
//
//  Created by Ayberk Yilmaz on 10/17/12.
//  Copyright (c) 2012 Ayberk Yilmaz. All rights reserved.
//

#import <Foundation/Foundation.h>

#define BUFFER_LEN 1000

@interface Interpreter : NSObject
{
    
}

@property (nonatomic, strong) NSString *inputCode;
@property (nonatomic, strong) NSMutableString *outputText;
@property (nonatomic, strong) NSString *inputConsole;

-(void)pushStack:(int)value;
-(int)popStack;


-(void)loop;
-(void)process;
-(void)processChar:(char)c;


@end
