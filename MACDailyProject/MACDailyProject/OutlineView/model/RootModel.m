//
//  RootModel.m
//  MACDailyProject
//
//  Created by Lynn on 2018/8/15.
//  Copyright © 2018年 DP. All rights reserved.
//

#import "RootModel.h"

@implementation RootModel

- (instancetype)init
{
    if (self = [super init]) {
        self.name = @"";
        self.isLeaf = NO;
        self.children = [NSMutableArray array];
    }
    return self;
}
@end
