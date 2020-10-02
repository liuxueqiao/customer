//
//  QBarChartView.h
//  SceneManage
//
//  Created by apple on 2018/11/23.
//  Copyright © 2018 lxq. All rights reserved.
//
/**
 //使用示例
 
 #import "QBarChartView.h"
 
 QBarData *data = [[QBarData alloc] init];
 data.values = @[@100, @120, @110];
 data.barColor = [UIColor redColor];
 data.kindName = @"可研预算";
 QBarData *data1 = [[QBarData alloc] init];
 data1.values = @[@1120, @1020, @1110];
 data1.barColor = [UIColor blueColor];
 data1.kindName = @"概算";
 QBarData *data2 = [[QBarData alloc] init];
 data2.values = @[@10, @20, @30];
 data2.barColor = [UIColor cyanColor];
 data2.kindName = @"本月支付";
 
 QBarChartView *chart = [[QBarChartView alloc] init];
 chart.datas = @[data, data1, data2];
 chart.XAxisTitles = @[@"第一周", @"第二周", @"第三周"];
 [self.view addSubview:chart];
 [chart mas_makeConstraints:^(MASConstraintMaker *make) {
 make.left.bottom.right.mas_equalTo(0);
 make.height.mas_equalTo(320.0);
 }];
 */

#import <UIKit/UIKit.h>
#import "QBarData.h"

@interface QBarChartView : UIView

@property (nonatomic, strong) NSArray<QBarData *> *datas;
@property (nonatomic, strong) NSArray<NSString *> *XAxisTitles;//个数与data.values个数对应

@property (nonatomic, strong) NSString *XAxisTitle;
@property (nonatomic, strong) UIColor *XAxisTitleColor;
@property (nonatomic, strong) UIFont *XAxisTitleSize;

@property (nonatomic, strong) UIColor *XAxisValueColor;
@property (nonatomic, strong) UIFont *XAxisValueSize;
@property (nonatomic, strong) UIColor *YAxisValueColor;
@property (nonatomic, strong) UIFont *YAxisValueSize;

- (void)showBarChart;

@end


