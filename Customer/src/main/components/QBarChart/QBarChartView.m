//
//  QBarChartView.m
//  SceneManage
//
//  Created by apple on 2018/11/23.
//  Copyright © 2018 lxq. All rights reserved.
//

#import "QBarChartView.h"

const NSInteger XAxisValueHeight = 30.0;
const NSInteger YAxisValueWidth = 30.0;
const NSInteger LeftSpace = 15.0;
const NSInteger BottomSpace = 15.0;
const NSInteger TopSpace = 30.0;
const NSInteger RightSpace = 15.0;

//柱状图数据配置
const CGFloat valueSpace = 15.0;
const CGFloat valueLittleSpace = 5.0;
const CGFloat valueItemWidth = 25.0;

@interface QBarChartView ()

/** 值和横向坐标，支持横向滚动 */
@property (nonatomic, strong) UIScrollView *XAxisScrollView;

@property (nonatomic, assign) CGFloat minYValue;
@property (nonatomic, assign) CGFloat maxYValue;//Y轴最大值
@property (nonatomic, assign) CGFloat maxYValueHeight;//Y轴最大值对应的长度
@property (nonatomic, assign) CGFloat YAxisHeight;//Y轴总长度
@end

@implementation QBarChartView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        self.XAxisTitle = @"";
        self.XAxisTitleColor = [UIColor grayColor];
        self.XAxisTitleSize = FONT_REGULAR(12);
        
        self.XAxisValueColor = [UIColor grayColor];
        self.XAxisValueSize = FONT_REGULAR(12);
        self.YAxisValueColor = [UIColor grayColor];
        self.YAxisValueSize = FONT_REGULAR(12);
        
    }
    return self;
}

- (void)showBarChart {
    [self setupXAxisValues];
    [self setupYAxisValues];
    [self setupYAxisTitle];
    [self setupInstructionView];
    
    //绘制柱状图数据
    [self setupValues];
}

#pragma mark - 绘制Y轴
- (void)drawYAxis {
    CGFloat lineX = YAxisValueWidth+LeftSpace;//竖线x坐标
    CGFloat lineTop = TopSpace;//竖线顶点y坐标
    CGFloat lineBottom = self.frame.size.height-BottomSpace-XAxisValueHeight;//竖线底点y坐标
    self.YAxisHeight = lineBottom-lineTop;
    
    //绘制竖线
    UIBezierPath *bezier = [UIBezierPath bezierPath];
    [bezier moveToPoint:CGPointMake(lineX, lineTop)];
    [bezier addLineToPoint:CGPointMake(lineX, lineBottom)];
    [bezier setLineWidth:1.0];
    [[UIColor grayColor] setStroke];
    [bezier stroke];
    
    //绘制箭头
    CGFloat arrowTopY = lineTop;
    CGFloat arrowBottomY = lineTop + 4.0;
    CGFloat arrowLeftX = lineX - 2.0;
    CGFloat arrowRightX = lineX + 2.0;
    UIBezierPath *arrowL = [UIBezierPath bezierPath];
    [arrowL moveToPoint:CGPointMake(lineX, arrowTopY)];
    [arrowL addLineToPoint:CGPointMake(arrowLeftX, arrowBottomY)];
    [arrowL setLineWidth:1.0];
    [[UIColor grayColor] setStroke];
    [arrowL stroke];
    UIBezierPath *arrowR = [UIBezierPath bezierPath];
    [arrowR moveToPoint:CGPointMake(lineX, arrowTopY)];
    [arrowR addLineToPoint:CGPointMake(arrowRightX, arrowBottomY)];
    [arrowR setLineWidth:1.0];
    [[UIColor grayColor] setStroke];
    [arrowR stroke];
}

#pragma mark - 绘制X轴
- (void)drawXAxis {
    CGFloat lineY = self.frame.size.height - BottomSpace - XAxisValueHeight;//竖线y坐标
    CGFloat lineLeft = YAxisValueWidth+LeftSpace;//横线左x坐标
    CGFloat lineRight = self.frame.size.width-RightSpace;//横线右点x坐标
    
    //绘制竖线
    UIBezierPath *bezier = [UIBezierPath bezierPath];
    [bezier moveToPoint:CGPointMake(lineLeft, lineY)];
    [bezier addLineToPoint:CGPointMake(lineRight, lineY)];
    [bezier setLineWidth:1.0];
    [[UIColor grayColor] setStroke];
    [bezier stroke];
    
    //绘制箭头
    CGFloat arrowTopY = lineY - 2.0;
    CGFloat arrowBottomY = lineY + 2.0;
    CGFloat arrowLeftX = lineRight - 4.0;
    CGFloat arrowRightX = lineRight;
    UIBezierPath *arrowL = [UIBezierPath bezierPath];
    [arrowL moveToPoint:CGPointMake(arrowRightX, lineY)];
    [arrowL addLineToPoint:CGPointMake(arrowLeftX, arrowTopY)];
    [arrowL setLineWidth:1.0];
    [[UIColor grayColor] setStroke];
    [arrowL stroke];
    UIBezierPath *arrowR = [UIBezierPath bezierPath];
    [arrowR moveToPoint:CGPointMake(arrowRightX, lineY)];
    [arrowR addLineToPoint:CGPointMake(arrowLeftX, arrowBottomY)];
    [arrowR setLineWidth:1.0];
    [[UIColor grayColor] setStroke];
    [arrowR stroke];
}

#pragma mark - 绘制柱状图数据
- (void)setupValues {
    NSInteger itemBarCount = self.datas.count;//bar的个数
    CGFloat labelWidth = valueItemWidth*itemBarCount + valueLittleSpace*(itemBarCount-1) + valueSpace;
    NSArray<QBarData *> *datas = self.datas;
    
    //把数据组放到集合里
    NSInteger valueCount = 0;
    NSMutableArray<NSArray *> *valuesList = [NSMutableArray array];
    NSMutableArray<UIColor *> *colorList = [NSMutableArray array];
    for (QBarData *data in datas) {
        [valuesList addObject:data.values];
        [colorList addObject:data.barColor];
        valueCount = data.values.count;
    }
    
    for (int i=0; i<valueCount; i++) {
        CGFloat baseX = YAxisValueWidth+LeftSpace+ i * labelWidth;
        int j=0;
        for (NSArray<NSNumber *> *values in valuesList) {
            CGFloat value = [values[i] floatValue];
            CGFloat minY = self.frame.size.height - XAxisValueHeight - BottomSpace - 0.5;//数值为value值的Y坐标
            CGFloat maxY = minY - (self.maxYValueHeight/self.maxYValue*value);//数值为0的Y坐标
            CGFloat leftbottomPointX = baseX+valueSpace+j*(valueItemWidth+valueLittleSpace);
            UIBezierPath *path = [UIBezierPath bezierPath];
            [path moveToPoint:CGPointMake(leftbottomPointX, minY)];
            [path addLineToPoint:CGPointMake(leftbottomPointX+valueItemWidth, minY)];
            [path addLineToPoint:CGPointMake(leftbottomPointX+valueItemWidth, maxY)];
            [path addLineToPoint:CGPointMake(leftbottomPointX, maxY)];
            [path closePath];
            [colorList[j] setFill];
            [path fill];
            j++;
        }
    }
}

#pragma mark - 绘制X轴值
- (void)setupXAxisValues {
    NSArray<NSString *> *XAxisTitles = self.XAxisTitles;
    CGFloat labelTop = self.frame.size.height - BottomSpace - XAxisValueHeight;//竖线y坐标
    
    NSInteger itemBarCount = self.datas.count;//bar的个数
    CGFloat labelWidth = valueItemWidth*itemBarCount + valueLittleSpace*(itemBarCount-1);
    CGFloat baseX = YAxisValueWidth + LeftSpace;
    NSInteger index = 0;
    for (NSString *title in XAxisTitles) {
        UILabel *label = [[UILabel alloc] init];
        label.frame = CGRectMake(baseX + valueSpace*(index+1) + labelWidth*index, labelTop, labelWidth, XAxisValueHeight);
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = self.XAxisValueColor;
        label.font = self.XAxisValueSize;
        label.text = title;
        label.numberOfLines = 0;
        label.adjustsFontSizeToFitWidth = YES;
        label.minimumScaleFactor = 0.5;
        [self addSubview:label];
        index ++;
    }
    
}

#pragma mark - 绘制Y轴值
- (void)setupYAxisValues {
    [self caculateYAxisValues];//计算出最大值和最小值
    CGFloat minYValue = self.minYValue;
    CGFloat maxYValue = self.maxYValue;
    NSInteger count = 10;//Y刻度分成10等份。
    self.maxYValueHeight = self.YAxisHeight-30.0;
    
    CGFloat labelX = 0;
    CGFloat itemHeight = (self.YAxisHeight-30.0)/count;
    CGFloat labelBaseY = self.frame.size.height - XAxisValueHeight - BottomSpace - itemHeight/2.0;
    CGFloat space = 5.0;//Y轴数值距离Y轴的距离
    CGFloat itemWidth = YAxisValueWidth+LeftSpace-space;
    
    for (NSInteger i=0; i<count+1; i++) {
        CGFloat value = minYValue+(maxYValue-minYValue)/count*i;
        CGFloat labelY =  labelBaseY-i*itemHeight;
        UILabel *label = [[UILabel alloc] init];
        label.frame = CGRectMake(labelX, labelY, itemWidth, itemHeight);
        label.textAlignment = NSTextAlignmentRight;
        label.textColor = self.YAxisValueColor;
        label.font = self.YAxisValueSize;
        label.text = [NSString stringWithFormat:@"%.f%@", value, @" "];
        [self addSubview:label];
        
        //绘制刻度点
        if (i > 0) {
            CGFloat pathY = labelY+itemHeight/2.0;
            UIBezierPath *path = [UIBezierPath bezierPath];
            [path moveToPoint:CGPointMake(itemWidth+space, pathY)];
            [path addLineToPoint:CGPointMake(itemWidth+space+2.0, pathY)];
            [path setLineWidth:1.0];
            [[UIColor grayColor] setStroke];
            [path stroke];
        }
    }
}

#pragma mark - 遍历所有数值，找出最大值和最小值，计算Y坐标的数值组
- (void)caculateYAxisValues {
    CGFloat minYValue = 0;//Y坐标初始值固定位0
    CGFloat maxYValue = 0;
    NSArray<QBarData *> *datas = self.datas;
    for (QBarData *data in datas) {
        NSArray *values = data.values;
        for (NSInteger i = 0; i<values.count; i++) {
            CGFloat value = [values[i] floatValue];
            if (maxYValue < value) {
                maxYValue = value;
            }
        }
    }
    
    //计算Y最大值取整，格度10等分。
    for (NSInteger i=10; i<NSIntegerMax; i*=10) {
        if (maxYValue < i) {
            NSInteger b = i/10;
            maxYValue = (((NSInteger)maxYValue)/b+1)*b;
            break;
        }
    }
    
    self.minYValue = minYValue;
    self.maxYValue = maxYValue;
}

#pragma mark - 绘制X轴标题
- (void)setupXAxisTitle {
    
    
}

#pragma mark - 绘制Y轴标题
- (void)setupYAxisTitle {
    
}

#pragma mark - 绘制色块说明视图，位于柱状图表上方
- (void)setupInstructionView {
    CGFloat baseX = YAxisValueWidth+LeftSpace+30.0;
    UIStackView *stackView = [[UIStackView alloc] init];
    stackView.axis = UILayoutConstraintAxisHorizontal;
    stackView.spacing = 5.0;
    [self addSubview:stackView];
    [stackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(baseX);
        make.top.mas_equalTo(25.0);
        make.height.mas_equalTo(12.0);
    }];
    
    NSArray<QBarData *> *datas = self.datas;
    NSInteger index = 0;
    for (QBarData *data in datas) {
        UIView *colorView = [[UIView alloc] init];
        colorView.backgroundColor = data.barColor;
        [stackView addArrangedSubview:colorView];
        [colorView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(20.0);
        }];
        
        UILabel *title = [[UILabel alloc] init];
        title.textColor = [UIColor grayColor];
        title.font = FONT_REGULAR(12);
        title.text = data.kindName;
        [stackView addArrangedSubview:title];
        
        index ++;
    }
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    [self drawXAxis];
    [self drawYAxis];
    [self showBarChart];
    
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGPathRef path1 = CGPathCreateWithRect(CGRectMake(100, 200, 100, 100), nil);
//    CGContextAddPath(context, path1);
//    CGContextSetLineWidth(context, 5.0);
//    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
//    //    CGContextDrawPath(context, kCGPathFillStroke);
//    CGContextStrokePath(context);
}


@end
