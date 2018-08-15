//
//  RootModel.h
//  MACDailyProject
//
//  Created by Lynn on 2018/8/15.
//  Copyright © 2018年 DP. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RootModel : NSObject

@property (nonatomic, strong) NSString * name;
@property (nonatomic, assign) BOOL isLeaf;
@property (nonatomic, strong) NSMutableArray *children;

@end
