//
//  SearchFieldCell.m
//  MACDailyProject
//
//  Created by Lynn on 2018/8/15.
//  Copyright © 2018年 DP. All rights reserved.
//

#import "SearchFieldCell.h"

@implementation SearchFieldCell
//通过代码实例化
- (id)init
{
    self = [super init];
    if (self)
    {
        [self setUp];
    }
    return self;
}
//通过xib实例化
- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        [self setUp];
    }
    return self;
}
- (void)setUp
{
    //重写搜索图标
    NSButtonCell *searchButtonCell = [self searchButtonCell];
    NSImage *searchImage = [NSImage imageNamed:NSImageNameHomeTemplate];
    [searchImage setSize:NSMakeSize(16, 16)];
    [searchButtonCell setImage:searchImage];
    [searchButtonCell setAlternateImage:searchImage];
    
    //重写取消图标
    NSButtonCell *cancelButtonCell = [self cancelButtonCell];
    NSImage *cancelImage = [NSImage imageNamed:NSImageNameRevealFreestandingTemplate];
    [cancelImage setSize:NSMakeSize(16, 16)];
    [cancelButtonCell setImage:cancelImage];
    [cancelButtonCell setAlternateImage:cancelImage];
    
}
//重写该方法实现对背景色的修改
- (void)drawInteriorWithFrame:(NSRect)cellFrame inView:(NSView *)controlView
{
//    NSRect rect = controlView.bounds;
//    NSBezierPath *bezierPath = [NSBezierPath bezierPathWithRoundedRect:rect
//                                                               xRadius:NSHeight(rect)/2
//                                                               yRadius:NSHeight(rect)/2];
//    [[NSColor orangeColor] set];
//    [bezierPath fill];
    [super drawInteriorWithFrame:cellFrame inView:controlView];
}

//重写该方法实现对光标颜色的修改
- (NSText *)setUpFieldEditorAttributes:(NSText *)textObj
{
    NSText *text = [super setUpFieldEditorAttributes:textObj];
    [(NSTextView*)text setInsertionPointColor:[NSColor redColor]];
    return text;
}
@end
