//
//  DatePicker.m
//  Customer
//
//  Created by apple on 2020/4/2.
//  Copyright © 2020 qiao. All rights reserved.
//

#import "DatePicker.h"

@interface DatePicker ()

@property (nonatomic, strong) void(^resultBLock)(NSString *date);
@property (nonatomic, strong) NSDate *defaultDate;

@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UIDatePicker *picker;
@end

@implementation DatePicker

- (instancetype)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];
  if (self) {
    [self _setupSubviews];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onPressBackground)];
    [self addGestureRecognizer:tap];
  }
  return self;
}

- (void)show:(void (^)(NSString * _Nonnull))resultBlock {
  self.resultBLock = resultBlock;
  if (!self.defaultDateString || self.defaultDateString.length == 0) {
    self.defaultDate = [NSDate new];
  } else {
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.dateFormat = @"yyyy-MM-dd";
    self.defaultDate = [formatter dateFromString:self.defaultDateString];
  }
  self.picker.date = self.defaultDate;
  
  [[UIApplication sharedApplication].keyWindow addSubview:self];
  self.frame = [UIScreen mainScreen].bounds;
  self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
}

- (void)onPressBackground {
  [self onCancelAction];
}

- (void)onCancelAction {
  if (self.resultBLock) {
    self.resultBLock(@"");
  }
  
  [self dismiss];
}

- (void)onSelectAction {
  NSDateFormatter *formatter = [NSDateFormatter new];
  formatter.dateFormat = @"yyyy-MM-dd";
  NSString *dateString = [formatter stringFromDate:self.picker.date];
  
  if (self.resultBLock) {
    self.resultBLock(dateString);
  }
  
  [self dismiss];
}

- (void)dismiss {
  [UIView animateWithDuration:0.25 animations:^{
    self.backgroundColor = [UIColor clearColor];
    self.contentView.alpha = 0;
  } completion:^(BOOL finished) {
    [self removeFromSuperview];
  }];
}

- (void)_setupSubviews {
  
  CGFloat contentWidth = [UIScreen mainScreen].bounds.size.width - 80;
  CGFloat contentHeight = 250;
  
  _contentView = [UIView new];
  _contentView.backgroundColor = [UIColor whiteColor];
  _contentView.layer.cornerRadius = 4.0;
  _contentView.frame = CGRectMake(40, ([UIScreen mainScreen].bounds.size.height -contentHeight)/2.0, contentWidth, contentHeight);
  [self addSubview:_contentView];
  
  _picker = [[UIDatePicker alloc] initWithFrame:CGRectMake(15, 5, contentWidth-30, contentHeight - 75)];
  _picker.datePickerMode = UIDatePickerModeDate;
  [_contentView addSubview:_picker];
  
  UIButton *cancel = [UIButton buttonWithType:UIButtonTypeCustom];
  cancel.frame = CGRectMake(contentWidth-160, contentHeight - 65, 70, 50);
  [cancel setTitle:@"取消" forState:UIControlStateNormal];
  [cancel setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
  [cancel addTarget:self action:@selector(onCancelAction) forControlEvents:UIControlEventTouchUpInside];
  [_contentView addSubview:cancel];
  
  UIButton *ok = [UIButton buttonWithType:UIButtonTypeCustom];
  ok.frame = CGRectMake(contentWidth-80, contentHeight-65, 70, 50);
  [ok setTitle:@"确定" forState:UIControlStateNormal];
  [ok setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
  [ok addTarget:self action:@selector(onSelectAction) forControlEvents:UIControlEventTouchUpInside];
  [_contentView addSubview:ok];
  
}

@end
