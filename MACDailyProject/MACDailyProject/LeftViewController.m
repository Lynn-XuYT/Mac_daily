//
//  LeftViewController.m
//  MACDailyProject
//
//  Created by Lynn on 2018/8/15.
//  Copyright © 2018年 DP. All rights reserved.
//

#import "LeftViewController.h"
//#import "SearchFieldCell.h"
#import "SearchField.h"

@interface LeftViewController ()<NSTextFieldDelegate, NSSearchFieldDelegate>

@property (nonatomic, strong) NSTextField *label;
@property (nonatomic, strong) NSTextField *field;
@property (nonatomic, strong) NSTextField *nextfield;
@property (nonatomic, strong) NSTextField *lastfield;
@end

@implementation LeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    
    [self addLabel];
    
    [self addTextField];
    
    [self addSearchField];
}

#pragma mark - addSearchField
- (void)addSearchField
{
    SearchField *searchField = [[SearchField alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.field.frame), CGRectGetMinY(self.field.frame) - CGRectGetHeight(self.field.frame) -10, CGRectGetWidth(self.field.frame) * 3, CGRectGetHeight(self.field.frame) * 0.5)];
    
//    searchField.textColor = [NSColor magentaColor];
//
//    searchField.bordered = NO;
//    searchField.delegate = self;
    
    // 去掉点击时外框的响应
    [searchField setFocusRingType:NSFocusRingTypeNone];
    
    
    
//    if (searchField.subviews.count) {
//        __block NSView *keyboardFocusClipView;
//        [searchField.subviews enumerateObjectsUsingBlock:^(id  obj,
//                                                                NSUInteger idx,
//                                                                BOOL *stop) {
//            //   NSClassFromString(@"_NSKeyboardFocusClipView");
//            if ([obj isKindOfClass:[NSClipView class]]) {
//                keyboardFocusClipView = obj;
//                *stop = YES;
//            }
//        }];
//
//        if (keyboardFocusClipView) {
//            NSView *view = keyboardFocusClipView.subviews[0];
//            [(NSTextView*)view setInsertionPointColor:[NSColor greenColor]];
//        }
//
//    }
    [self.view addSubview:searchField];
}

#pragma mark - NSSearchFieldDelegate
- (void)searchFieldDidStartSearching:(NSSearchField *)sender
{
    
}

- (void)searchFieldDidEndSearching:(NSSearchField *)sender
{
    
}


#pragma mark - addLabel
- (void)addLabel
{
    NSTextField *label = [[NSTextField alloc] init];
    label.enabled = NO;
    label.bordered = NO;
    
    label.backgroundColor = [NSColor blueColor];
    label.textColor = [NSColor magentaColor];
    
    label.alignment = NSTextAlignmentRight;
    
    label.maximumNumberOfLines = 3;
    label.frame = NSMakeRect(0, CGRectGetMaxY(self.view.bounds) - 25 - 22, 50, 50);
    label.stringValue = @"这是一个Label这是一个Label这是一个Label这是一个Label";
    
    [self.view addSubview:label];
    self.label = label;
}

#pragma mark - addTextField
- (void)addTextField
{
    NSTextField *field = [self getTextField:CGRectMake(CGRectGetMinX(self.label.frame), CGRectGetMinY(self.label.frame) - CGRectGetHeight(self.label.frame) -10, CGRectGetWidth(self.label.frame), CGRectGetHeight(self.label.frame))];
    [self.view addSubview:field];
    self.field = field;
    
    
    NSTextField *nextField = [self getTextField:CGRectMake(CGRectGetMaxX(self.field.frame) + 10, CGRectGetMinY(self.field.frame), CGRectGetWidth(self.field.frame), CGRectGetHeight(self.field.frame))];
    
    [self.view addSubview:nextField];
    self.nextfield = nextField;
    
    
    NSTextField *lastField =[self getTextField:CGRectMake(CGRectGetMaxX(self.nextfield.frame) + 10, CGRectGetMinY(self.field.frame), CGRectGetWidth(self.field.frame), CGRectGetHeight(self.field.frame))];
    [self.view addSubview:lastField];
    self.lastfield = lastField;
    
//    self.field.nextKeyView = self.nextfield;
//    self.nextfield.nextKeyView = self.lastfield;
//    self.lastfield.nextKeyView = self.field;
    
}

- (NSTextField *)getTextField:(CGRect)frame
{
    NSTextField *field = [[NSTextField alloc] initWithFrame:frame];
    
    field.backgroundColor = [NSColor redColor];
    field.textColor = [NSColor magentaColor];
    
    field.bordered = NO;
    field.delegate = self;
    
    // 去掉点击时外框的响应
    [field setFocusRingType:NSFocusRingTypeNone];
    
    return field;
}

#pragma mark - NSControlSubclassNotifications

- (void)controlTextDidBeginEditing:(NSNotification *)obj {
    
    NSTextField *field = obj.object;
    
    NSLog(@"controlTextDidBeginEditing : %@",field.stringValue);
    
}

- (void)controlTextDidEndEditing:(NSNotification *)obj {
    
    NSTextField *field = obj.object;
    
    NSLog(@"controlTextDidEndEditing : %@",field.stringValue);
}


- (void)controlTextDidChange:(NSNotification *)obj {
    
    NSTextField *field = obj.object;
    
    NSLog(@"controlTextDidChange : %@",field.stringValue);
}

#pragma mark - NSTextFieldDelegate

//- (nullable NSArray *)textField:(NSTextField *)textField textView:(NSTextView *)textView candidatesForSelectedRange:(NSRange)selectedRange
//{
//
//}
//
//- (NSArray<NSTextCheckingResult *> *)textField:(NSTextField *)textField textView:(NSTextView *)textView candidates:(NSArray<NSTextCheckingResult *> *)candidates forSelectedRange:(NSRange)selectedRange{
//}
//
//- (BOOL)textField:(NSTextField *)textField textView:(NSTextView *)textView shouldSelectCandidateAtIndex:(NSUInteger)index
//{
//
//}

//点击 field 并准备输入第一个字母时。
- (BOOL)control:(NSControl *)control textShouldBeginEditing:(NSText *)fieldEditor
{
    return YES;
}

//不再填写这个 field(如：去填写另外一个 field 的时)调用。如果文字没有改变，就不会调用。
- (BOOL)control:(NSControl *)control textShouldEndEditing:(NSText *)fieldEditor
{
    return YES;
}




//输入文字后，在 EndEditing 之前调用。如果文字没有改变，就不会调用。
//返回 NO 时，这个窗口不会响应其他的点击事件（不能去填别的）。
- (BOOL)control:(NSControl *)control isValidObject:(nullable id)obj
{
    return YES;
}

//被其他方法调用时，如：点击 delete 按钮,commandSelector 为 deleteBackward:. tab:insertTab: 。
//返回 YES 时，delete、tab 这些方法调用失败。所以需要返回 NO。
- (BOOL)control:(NSControl *)control textView:(NSTextView *)textView doCommandBySelector:(SEL)commandSelector
{
    return NO;
}

//- (BOOL)control:(NSControl *)control didFailToFormatString:(NSString *)string errorDescription:(nullable NSString *)error
//{
//    return YES;
//}
//
//- (void)control:(NSControl *)control didFailToValidatePartialString:(NSString *)string errorDescription:(nullable NSString *)error
//{
//    NSLog(@"didFailToValidatePartialString : %@",string);
//
//
//- (NSArray<NSString *> *)control:(NSControl *)control textView:(NSTextView *)textView completions:(NSArray<NSString *> *)words forPartialWordRange:(NSRange)charRange indexOfSelectedItem:(NSInteger *)index
//{
//
//    NSLog(@"completions : %@",words);
//
//    return words;
//}
@end
