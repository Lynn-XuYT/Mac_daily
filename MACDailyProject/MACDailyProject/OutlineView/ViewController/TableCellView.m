//
//  TableCellView.m
//  MACDailyProject
//
//  Created by Lynn on 2018/8/15.
//  Copyright © 2018年 DP. All rights reserved.
//

#import "TableCellView.h"

@implementation TableCellView

- (instancetype)initWithCoder:(NSCoder *)decoder
{
    self = [super initWithCoder:decoder];
    if (self)
    {
    }
    return self;
}
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

- (void)mouseDown:(NSEvent *)event
{
    NSLog(@"mouseDown");
    if ([self.delegate respondsToSelector:@selector(mouseClickDown:)]) {
        [self.delegate mouseClickDown:self];
    }
}

@end

@implementation TitleCellView

- (instancetype)initWithCoder:(NSCoder *)decoder
{
    self = [super initWithCoder:decoder];
    if (self)
    {
//        view.invalidateRestorableState;
    }
    return self;
}

//-(void)setBackgroundStyle:(NSBackgroundStyle)backgroundStyle
//{
//    [super setBackgroundStyle:backgroundStyle];
//    [self setWantsLayer:YES];
//    if(backgroundStyle == NSBackgroundStyleDark)
//    {
//        self.layer.backgroundColor = [NSColor yellowColor].CGColor;
//    }
//    else
//    {
//        self.layer.backgroundColor = [NSColor whiteColor].CGColor;
//    }
//}

@end
