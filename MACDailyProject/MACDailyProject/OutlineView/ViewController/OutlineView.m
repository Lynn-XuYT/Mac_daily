//
//  OutlineView.m
//  MACDailyProject
//
//  Created by Lynn on 2018/8/15.
//  Copyright © 2018年 DP. All rights reserved.
//

#import "OutlineView.h"

@implementation OutlineView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}

- (BOOL)validateProposedFirstResponder:(NSResponder *)responder forEvent:(NSEvent *)event
{
    return YES;
}

//- (NSView *)makeViewWithIdentifier:(NSUserInterfaceItemIdentifier)identifier owner:(id)owner
//{
//    id view = [super makeViewWithIdentifier:identifier owner:owner];
//
//    if ([identifier isEqualToString:NSOutlineViewDisclosureButtonKey])
//    {
//
//        // Do your customization
//
//        // return disclosure button view
//
////        [view setImage:[NSImage imageNamed:NSImageNameAddTemplate]];
////
////        [view setAlternateImage:[NSImage imageNamed:NSImageNameRemoveTemplate]];
////
////        [view setBordered:NO];
////
////        [view setTitle:@""];
//
////        [((NSButton *)view) setTarget:self];
////        [((NSButton *)view) setAction:@selector(buttonClick:)];
////        ((NSButton *)view)
//
//        return view;
//
//    }
//
//    return view;
//}
@end
