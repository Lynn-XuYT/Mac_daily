//
//  TableRowView.h
//  MACDailyProject
//
//  Created by Lynn on 2018/8/21.
//  Copyright © 2018年 DP. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "OutlineViewController.h"

@interface TableRowView : NSTableRowView
@property (nonatomic, strong) id item;
@property (nonatomic, strong) id<OutlineViewControllerDeleagate> delegate;

@end
