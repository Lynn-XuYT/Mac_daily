//
//  SearchField.m
//  MACDailyProject
//
//  Created by Lynn on 2018/8/15.
//  Copyright © 2018年 DP. All rights reserved.
//

#import "SearchField.h"
#import "SearchFieldCell.h"

@implementation SearchField

+ (void)setCellClass:(Class)factoryId
{
    [super setCellClass:[SearchFieldCell class]];
}

+ (Class)cellClass
{
    return [SearchFieldCell class];
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    // Drawing code here.
}

@end
