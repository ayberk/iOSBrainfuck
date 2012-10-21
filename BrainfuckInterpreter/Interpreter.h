//
//  Interpreter.h
//  BrainfuckInterpreter
//
//  Created by Ayberk Yilmaz on 10/17/12.
//  Copyright (c) 2012 Ayberk Yilmaz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Interpreter : NSObject

@property (nonatomic, strong) NSString *inputCode;
@property (nonatomic, strong) NSMutableString *outputText;
@property (nonatomic, strong) NSString *inputConsole;

-(void)process;
-(void)processChar:(char)c inBuffer:(char*)buffer withIndex:(int*)inputIndex;

@end
