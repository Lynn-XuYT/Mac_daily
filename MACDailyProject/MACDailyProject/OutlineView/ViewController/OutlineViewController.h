//
//  OutlineViewController.h
//  MACDailyProject
//
//  Created by Lynn on 2018/8/15.
//  Copyright © 2018年 DP. All rights reserved.
//

#import <Cocoa/Cocoa.h>
@class TableCellView;
@class RootModel;

@protocol OutlineViewControllerDeleagate <NSObject>

- (void)mouseClickDown:(TableCellView *)cell;
- (void)mouseClickDownAtRoot:(RootModel *)item;
@end

@interface OutlineViewController : NSViewController

@end
