//
//  OutlineViewController.m
//  MACDailyProject
//
//  Created by Lynn on 2018/8/15.
//  Copyright © 2018年 DP. All rights reserved.
//

#import "OutlineViewController.h"
#import "RootModel.h"
#import "LeafModel.h"

@interface OutlineViewController ()<NSOutlineViewDelegate, NSOutlineViewDataSource>
@property (weak) IBOutlet NSOutlineView *outlineView;

@property (nonatomic, strong) NSMutableArray *rootArray;

@end

@implementation OutlineViewController

- (instancetype)init
{
    if (self = [super init]) {
        [self setUpDataSource];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    self.view.layer.backgroundColor = [NSColor whiteColor].CGColor;
    
    [self setUpDataSource];
    self.outlineView.dataSource = self;
    self.outlineView.delegate = self;
    [self.outlineView reloadData];
}

- (void)setUpDataSource
{
    self.rootArray = [NSMutableArray array];
    for (int i = 0; i <5; i++) {
        RootModel *root = [[RootModel alloc] init];
        root.name = [NSString stringWithFormat:@"root-%d",i];
        
        for (int i = 0; i <2; i++) {
            LeafModel *leaf = [[LeafModel alloc] init];
            leaf.leafname = [NSString stringWithFormat:@"Leaf-%d",i];
            [root.children addObject:leaf];
        }
        
        for (int i = 0; i <2; i++) {
            LeafModel *leaf = [[LeafModel alloc] init];
            leaf.leafname = [NSString stringWithFormat:@"Leaf-%d",i + 2];
            leaf.hasChildren = YES;
            for (int i = 0; i <3; i++) {
                LeafModel *leaf0 = [[LeafModel alloc] init];
                leaf0.leafname = [NSString stringWithFormat:@"Leaf-%d",i + 2];
                [leaf.leafChildren addObject:leaf0];
            }
            [root.children addObject:leaf];
        }
        
        for (int i = 0; i <2; i++) {
            RootModel *root1 = [[RootModel alloc] init];
            root1.name = [NSString stringWithFormat:@"root1-%d",i + 4];
//            root1.isLeaf = NO;
            for (int i = 0; i <3; i++) {
                LeafModel *leaf0 = [[LeafModel alloc] init];
                leaf0.leafname = [NSString stringWithFormat:@"Leaf-%d",i + 4];
                [root1.children addObject:leaf0];
            }
            [root.children addObject:root1];
        }
        
        [self.rootArray addObject:root];
    }
}

#pragma mark - NSOutlineViewDataSource
// NSOutlineView获得每个层级需要显示的节点数，当数据为顶级节点（根结点）时，item的值为nil
// item的值为nil
// 当NSOutlineView需要展示数据时，第一步会调用此方法
- (NSInteger)outlineView:(NSOutlineView *)outlineView numberOfChildrenOfItem:(id)item
{
    if ([item isKindOfClass:[RootModel class]]) {
        
        return ((RootModel *)item).children.count;
    }
    else if ([item isKindOfClass:[LeafModel class]])
    {
        if (((LeafModel *)item).hasChildren) {
            return ((LeafModel *)item).leafChildren.count;
        }
    }
    return self.rootArray.count;
}

// NSOutlineView知道每个层级节点的显示数据
// 当NSOutlineView需要展示数据时，第二步会调用此方法
- (id)outlineView:(NSOutlineView *)outlineView child:(NSInteger)index ofItem:(nullable id)item
{
    if ([item isKindOfClass:[RootModel class]]) {
        
        return ((RootModel *)item).children[index];
    }
    if ([item isKindOfClass:[LeafModel class]]) {
        
        if (((LeafModel *)item).hasChildren) {
            return ((LeafModel *)item).leafChildren[index];
        }
    }
    return self.rootArray[index];
}


// NSOutlineView可以判断本结点是否可以展开（知否有子节点）
// 当NSOutlineView需要展示数据时，第三步会调用此方法
- (BOOL)outlineView:(NSOutlineView *)outlineView isItemExpandable:(id)item
{
    if ([item isKindOfClass:[RootModel class]]) {
        
        return YES;
    }
    if ([item isKindOfClass:[LeafModel class]]) {
        
        if (((LeafModel *)item).hasChildren) {
            return YES;
        }
    }
    return NO;
}

#pragma mark - NSOutlineViewDelegate
- (nullable NSView *)outlineView:(NSOutlineView *)outlineView viewForTableColumn:(nullable NSTableColumn *)tableColumn item:(id)item
{
    NSTableCellView *cell;
    if ([item isKindOfClass:[RootModel class]]) {
        
        cell = [outlineView makeViewWithIdentifier:@"RootCell" owner:self];
        cell.textField.stringValue = ((RootModel *)item).name;
    }
    else
    {
        cell = [outlineView makeViewWithIdentifier:@"LeafCell" owner:self];
        cell.textField.stringValue = ((LeafModel *)item).leafname;
    }
    return cell;
}

@end
