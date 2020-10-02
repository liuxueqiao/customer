//
//  QBarData.h
//  SceneManage
//
//  Created by apple on 2018/11/23.
//  Copyright © 2018 lxq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QBarData : NSObject

@property (nonatomic, strong) NSArray *values;//可以转成CGFloat，为NSString或者NSnumber都可以。
@property (nonatomic, strong) UIColor *barColor;
@property (nonatomic, strong) NSString *kindName;

@end


