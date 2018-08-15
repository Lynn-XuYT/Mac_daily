//
//  LeftViewController.m
//  MACDailyProject
//
//  Created by Lynn on 2018/8/15.
//  Copyright © 2018年 DP. All rights reserved.
//

#import "LeftViewController.h"

@interface LeftViewController ()

@end

@implementation LeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    
    [self addLabel];
}


- (void)addLabel
{
    NSTextField *label = [[NSTextField alloc] init];
    label.enabled = NO;
    label.bordered = NO;
    
    label.backgroundColor = [NSColor blueColor];
    label.textColor = [NSColor magentaColor];
    
    label.alignment = NSTextAlignmentRight;
    
    label.maximumNumberOfLines = 3;
    label.frame = NSMakeRect(0, CGRectGetMaxY(self.view.bounds) - 25 - 22, 50, 50);
    label.stringValue = @"这是一个Label这是一个Label这是一个Label这是一个Label";
    
    [self.view addSubview:label];
}

@end
