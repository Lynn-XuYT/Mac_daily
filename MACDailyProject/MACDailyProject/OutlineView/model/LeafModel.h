//
//  LeafModel.h
//  MACDailyProject
//
//  Created by Lynn on 2018/8/15.
//  Copyright © 2018年 DP. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LeafModel : NSObject
@property (nonatomic, strong) NSString *leafname;
@property (nonatomic, assign) BOOL hasChildren;
@property (nonatomic, strong) NSMutableArray *leafChildren;
@end
