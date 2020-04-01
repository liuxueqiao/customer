//
//  UIColor+CUSColor.m
//  Customer
//
//  Created by apple on 2020/3/30.
//  Copyright © 2020 qiao. All rights reserved.
//

#import "UIColor+CUSColor.h"

@implementation UIColor (CUSColor)


+ (UIColor *)CUS_colorWithHexString:(NSString *)hexString {
    return [UIColor CUS_colorWithHexString:hexString alpha:1.0];
}

+ (UIColor *)CUS_colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha {
    //剔除#
    hexString = [hexString stringByReplacingOccurrencesOfString:@"#" withString:@""];
    unsigned int red, green, blue;
    NSRange range;
    range.length =2;
    
    range.location =0;
    [[NSScanner scannerWithString:[hexString substringWithRange:range]]scanHexInt:&red];
    range.location =2;
    [[NSScanner scannerWithString:[hexString substringWithRange:range]]scanHexInt:&green];
    range.location =4;
    [[NSScanner scannerWithString:[hexString substringWithRange:range]]scanHexInt:&blue];
    
    return [UIColor colorWithRed:(float)(red/255.0f)
                           green:(float)(green/255.0f)
                            blue:(float)(blue/255.0f)
                           alpha:alpha];
}

+ (UIColor *)CUS_colorWithRGB:(CGFloat)r g:(CGFloat)g b:(CGFloat)b {
    return [UIColor CUS_colorWithRGB:r g:g b:b alpha:1.0];
}
+ (UIColor *)CUS_colorWithRGB:(CGFloat)r g:(CGFloat)g b:(CGFloat)b alpha:(CGFloat)alpha {
    return [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(alpha)];
}

+ (UIColor *)CUS_themeColor {
    return [UIColor CUS_colorWithHexString:@"#152535"];
}
+ (UIColor *)CUS_redColor {
    return [UIColor CUS_colorWithHexString:@"#E26161"];
}
+ (UIColor *)CUS_blueColor {
    return [UIColor CUS_colorWithRGB:94 g:117 b:173];
}
+ (UIColor *)CUS_orangeColor {
    return [UIColor CUS_colorWithHexString:@"#FF9933"];
}
+ (UIColor *)CUS_blackColor {
    return [UIColor CUS_colorWithHexString:@"#333333"];
}
+ (UIColor *)CUS_grayColor {
    return [UIColor CUS_colorWithHexString:@"#666666"];
}
+ (UIColor *)CUS_lightGrayColor {
    return [UIColor CUS_colorWithHexString:@"#999999"];
}
+ (UIColor *)CUS_lineColor {
    return [UIColor CUS_colorWithHexString:@"#E3E3E4"];
}
+ (UIColor *)CUS_spaceColor {
    return [UIColor CUS_colorWithRGB:245 g:245 b:245];
}


@end
