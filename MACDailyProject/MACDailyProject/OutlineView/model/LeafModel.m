//
//  LeafModel.m
//  MACDailyProject
//
//  Created by Lynn on 2018/8/15.
//  Copyright © 2018年 DP. All rights reserved.
//

#import "LeafModel.h"

@implementation LeafModel
- (instancetype)init
{
    if (self = [super init]) {
        self.leafname = @"";
        self.hasChildren = NO;
        self.leafChildren = [NSMutableArray array];
    }
    return self;
}
@end
