//
//  TableCellView.h
//  MACDailyProject
//
//  Created by Lynn on 2018/8/15.
//  Copyright © 2018年 DP. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#import "OutlineViewController.h"
@interface TableCellView : NSTableCellView

@property (nonatomic, strong) id item;
@property (nonatomic, strong) id<OutlineViewControllerDeleagate> delegate;
@end

@interface TitleCellView : NSTableCellView

@end
