//
//  BottomView.m
//  MACDailyProject
//
//  Created by Lynn on 2018/8/15.
//  Copyright © 2018年 DP. All rights reserved.
//

#import "BottomView.h"

@interface BottomView ()

@property(nonatomic,strong) NSTrackingArea *mytrackingArea;

@end

@implementation BottomView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
    
    self.mytrackingArea = [[NSTrackingArea alloc] initWithRect:dirtyRect
                                                      options:(NSTrackingMouseEnteredAndExited |
                                                               NSTrackingMouseMoved |
                                                               NSTrackingCursorUpdate |
                                                               NSTrackingActiveWhenFirstResponder |
                                                               NSTrackingActiveInKeyWindow |
                                                               NSTrackingActiveInActiveApp |
                                                               NSTrackingActiveAlways |
                                                               NSTrackingAssumeInside |
                                                               NSTrackingInVisibleRect |
                                                               NSTrackingEnabledDuringMouseDrag)
                                                        owner:self
                                                     userInfo:nil];
    
    [self addTrackingArea:self.mytrackingArea];
    
}

//NSTrackingMouseEnteredAndExited     = 0x01,//鼠标进入和退出
//NSTrackingMouseMoved                = 0x02,//鼠标移动
//NSTrackingCursorUpdate      = 0x04, //更新鼠标光标形状
//NSTrackingActiveWhenFirstResponder  = 0x10, //第一响应者时跟踪所有事件
//NSTrackingActiveInKeyWindow         = 0x20, //应用是key Window时 跟踪所有事件
//NSTrackingActiveInActiveApp     = 0x40, //应用是激活状态时跟踪所有事件
//NSTrackingActiveAlways      = 0x80, //跟踪所有事件（鼠标进入/退出/移动)
//
//NSTrackingAssumeInside              = 0x100,
//NSTrackingInVisibleRect             = 0x200,
//NSTrackingEnabledDuringMouseDrag    = 0x400

//鼠标进入
- (void)mouseEntered:(NSEvent *)event
{
//    NSLog(@"鼠标进入");
}

//退出
- (void)mouseExited:(NSEvent *)event
{
//    NSLog(@"鼠标退出");
}

//鼠标移动
- (void)mouseMoved:(NSEvent *)event
{
    NSLog(@"鼠标移动");
}

//更新鼠标光标形状
- (void)cursorUpdate:(NSEvent *)event
{
    //更改鼠标光标样式
    [[NSCursor openHandCursor] set];
//    + (NSCursor *)arrowCursor;
//    + (NSCursor *)IBeamCursor;
//    + (NSCursor *)pointingHandCursor;
//    + (NSCursor *)closedHandCursor;
//    + (NSCursor *)openHandCursor;
//    + (NSCursor *)resizeLeftCursor;
//    + (NSCursor *)resizeRightCursor;
//    + (NSCursor *)resizeLeftRightCursor;
//    + (NSCursor *)resizeUpCursor;
//    + (NSCursor *)resizeDownCursor;
//    + (NSCursor *)resizeUpDownCursor;
//    + (NSCursor *)crosshairCursor;
//    + (NSCursor *)disappearingItemCursor;
//    + (NSCursor *)operationNotAllowedCursor NS_AVAILABLE_MAC(10_5);
//    + (NSCursor *)dragLinkCursor NS_AVAILABLE_MAC(10_6);
//    + (NSCursor *)dragCopyCursor NS_AVAILABLE_MAC(10_6);
//    + (NSCursor *)contextualMenuCursor NS_AVAILABLE_MAC(10_6);
//    + (NSCursor *)IBeamCursorForVerticalLayout NS_AVAILABLE_MAC(10_7);
}

// 左右鼠标点击
- (void)mouseDown:(NSEvent *)event
{
    //获取鼠标点击位置坐标：先获取event发生的window中的坐标，在转换成view视图坐标系的坐标。
//    NSPoint eventLocation = [event locationInWindow];
//    NSPoint center = [self convertPoint:eventLocation fromView:nil];
    
    //与上面等价
    NSPoint clickLocation = [self convertPoint:[event locationInWindow]
                                      fromView:nil];
    
    NSLog(@"左键点击 - position = （%f，%f）- count = %ld", clickLocation.x, clickLocation.y, (long)event.clickCount);
}

- (void)mouseUp:(NSEvent *)event
{
    NSLog(@"左键抬起");
}

- (void)rightMouseDown:(NSEvent *)event
{
    NSPoint clickLocation = [self convertPoint:[event locationInWindow]
                                      fromView:nil];
    
    NSLog(@"右键点击 - position = （%f，%f）- count = %ld", clickLocation.x, clickLocation.y, (long)event.clickCount);
}

- (void)rightMouseUp:(NSEvent *)event
{
    NSLog(@"右键抬起");
}

// 左键拖动
- (void)mouseDragged:(NSEvent *)event
{
    NSLog(@"左键拖动");
}

// 右键拖动
- (void)rightMouseDragged:(NSEvent *)event
{
    NSLog(@"右键拖动");
}

@end
