//
//  TableRowView.m
//  MACDailyProject
//
//  Created by Lynn on 2018/8/21.
//  Copyright © 2018年 DP. All rights reserved.
//

#import "TableRowView.h"

@implementation TableRowView

- (instancetype)initWithFrame:(NSRect)frameRect
{
    self = [super initWithFrame:frameRect];
    if (self)
    {
    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
    
}

- (void)addSubview:(NSView *)view
{
    if ([view isKindOfClass:[NSButton class]]) {
        NSButton *btn = (NSButton *)view;
        [btn setImage:[NSImage imageNamed:NSImageNameAddTemplate]];
        [btn setAlternateImage:[NSImage imageNamed:NSImageNameRemoveTemplate]];
        [btn setBordered:NO];
        [btn setTitle:@""];
        [btn setTarget:self];
        [btn setAction:@selector(buttonClick:)];
    }
    [super addSubview:view];
}

- (void)buttonClick:(id)sender
{
    NSLog(@"buttonClick");
    if ([self.delegate respondsToSelector:@selector(mouseClickDownAtRoot:)]) {
        [self.delegate mouseClickDownAtRoot:self.item];
    }
}

@end
