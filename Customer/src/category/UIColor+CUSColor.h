//
//  UIColor+CUSColor.h
//  Customer
//
//  Created by apple on 2020/3/30.
//  Copyright © 2020 qiao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (CUSColor)

/**
 16进制转  UIColor
 @param hexString @"#999999"
 @return UIColor
 */
+ (UIColor *)CUS_colorWithHexString:(NSString *)hexString;
+ (UIColor *)CUS_colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha;

+ (UIColor *)CUS_colorWithRGB:(CGFloat)r g:(CGFloat)g b:(CGFloat)b;
+ (UIColor *)CUS_colorWithRGB:(CGFloat)r g:(CGFloat)g b:(CGFloat)b alpha:(CGFloat)alpha;

+ (UIColor *)CUS_themeColor;
+ (UIColor *)CUS_redColor;
+ (UIColor *)CUS_blueColor;
+ (UIColor *)CUS_orangeColor;
+ (UIColor *)CUS_blackColor;
+ (UIColor *)CUS_grayColor;
+ (UIColor *)CUS_lightGrayColor;
+ (UIColor *)CUS_lineColor;
+ (UIColor *)CUS_spaceColor;


@end

NS_ASSUME_NONNULL_END
