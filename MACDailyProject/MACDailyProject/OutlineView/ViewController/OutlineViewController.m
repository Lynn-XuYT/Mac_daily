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
#import "OutlineView.h"
#import "TableRowView.h"
#import "TableCellView.h"

@interface OutlineViewController ()<NSOutlineViewDelegate, NSOutlineViewDataSource,OutlineViewControllerDeleagate>
@property (weak) IBOutlet OutlineView *outlineView;

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
    
    self.outlineView.gridStyleMask = NSTableViewGridNone;
}

- (void)setUpDataSource
{
    self.rootArray = [NSMutableArray array];
    
    NSString *str = @"title";
    [self.rootArray addObject:str];
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
            leaf.hasChildren = NO;
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
    return NO;
}

#pragma mark - NSOutlineViewDelegate
- (nullable NSView *)outlineView:(NSOutlineView *)outlineView viewForTableColumn:(nullable NSTableColumn *)tableColumn item:(id)item
{
    NSTableCellView *cell;
    if ([item isKindOfClass:[RootModel class]]) {
        
        TableCellView *ncell = (TableCellView *)[outlineView makeViewWithIdentifier:@"RootCell" owner:self];
        ncell.textField.stringValue = ((RootModel *)item).name;
        ncell.delegate = self;
        ncell.item = item;
        cell = ncell;
        
    }
    else if ([item isKindOfClass:[LeafModel class]])
    {
        TableCellView *ncell = (TableCellView *)[outlineView makeViewWithIdentifier:@"LeafCell" owner:self];
        cell.textField.stringValue = ((LeafModel *)item).leafname;
        ncell.delegate = self;
        ncell.item = item;
        cell = ncell;
    }
    else
    {
        cell = [outlineView makeViewWithIdentifier:@"titleCell" owner:self];
        cell.textField.stringValue = ((NSString *)item);
        cell.accessibilityEnabled = NO;
    }
    
    return cell;
}

- (NSTableRowView *)outlineView:(NSOutlineView *)outlineView rowViewForItem:(id)item
{
    NSTableRowView *rowView;
    if ([item isKindOfClass:[RootModel class]]) {
        static NSString* const kRowIdentifier = @"RootRowView";
        rowView = [outlineView makeViewWithIdentifier:kRowIdentifier owner:self];
        if (!rowView) {
            // Size doesn't matter, the table will set it
            rowView = [[TableRowView alloc] initWithFrame:NSZeroRect];
            
            // This seemingly magical line enables your view to be found
            // next time "makeViewWithIdentifier" is called.
            rowView.identifier = kRowIdentifier;
        }
        ((TableRowView *)rowView).delegate = self;
        ((TableRowView *)rowView).item = item;
    }
    else
    {
        static NSString* const kRowIdentifier2 = @"LeafRowView";
        rowView = [outlineView makeViewWithIdentifier:kRowIdentifier2 owner:self];
        if (!rowView) {
            // Size doesn't matter, the table will set it
            rowView = [[NSTableRowView alloc] initWithFrame:NSZeroRect];
            // This seemingly magical line enables your view to be found
            // next time "makeViewWithIdentifier" is called.
            rowView.identifier = kRowIdentifier2;
        }
        
    }
    
    // Can customize properties here. Note that customizing
    // 'backgroundColor' isn't going to work at this point since the table
    // will reset it later. Use 'didAddRow' to customize if desired.
    
    return rowView;
}

- (BOOL)outlineView:(NSOutlineView *)outlineView shouldSelectItem:(id)item
{
    if ([item isKindOfClass:[NSString class]]) {
        return NO;
    }
    return YES;
}

- (CGFloat)outlineView:(NSOutlineView *)outlineView heightOfRowByItem:(id)item
{
    if ([item isKindOfClass:[NSString class]]) {
        return 17;
    }
    return 40;
}

- (void)mouseClickDown:(TableCellView *)cell
{
    id item = cell.item;
    if (item) {
        [self mouseClickDownAtRoot:item];
    }
}

- (void)mouseClickDownAtRoot:(RootModel *)item
{
    if (item) {
        NSInteger row = [self.outlineView rowForItem:item];
        [self.outlineView selectRowIndexes:[NSIndexSet indexSetWithIndex:row] byExtendingSelection:false];
        if ([self.outlineView isItemExpanded:item]) {
            [self.outlineView collapseItem:item];
        }
        else
        {
            [self.outlineView expandItem:item];
        }
    }
}
@end
