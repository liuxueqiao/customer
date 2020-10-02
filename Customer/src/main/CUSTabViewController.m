//
//  CUSTabViewController.m
//  Customer
//
//  Created by apple on 2020/3/30.
//  Copyright © 2020 qiao. All rights reserved.
//

#import "CUSTabViewController.h"
#import "CUSHomeViewController.h"
#import "CUSMineViewController.h"

@interface CUSTabViewController ()

@end

@implementation CUSTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self _config];
    [self _setViewControllersAndItems];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationDidBecomeActive) name:UIApplicationDidBecomeActiveNotification object:nil];
    
}
#pragma mark - app进入活跃状态
- (void)applicationDidBecomeActive {
    NSLog(@"");
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)_config {
//    self.tabBar.tintColor = THEME_COLOR;
//    self.tabBar.backgroundColor = [MTTools defaultBackgroundColor];
//    if (@available(iOS 10.0, *)) {
//        self.tabBar.unselectedItemTintColor = COMMON_LIGHT_GRAY_COLOR;
//    }
}

- (void)_setViewControllersAndItems {
    UINavigationController *homeNav = [[UINavigationController alloc] initWithRootViewController:[CUSHomeViewController new]];
    UINavigationController *mineNav = [[UINavigationController alloc] initWithRootViewController:[CUSMineViewController new]];
    self.viewControllers = @[homeNav, mineNav];
    
    
    self.viewControllers = @[homeNav, mineNav];
    NSArray *titleArr = @[@"首页", @"我的"];
    NSArray *imageArr = @[@"main_home", @"main_task"];
    NSArray *selectedImageArr = @[@"main_home0", @"main_task0"];
    NSArray *items = self.tabBar.items;
    for (NSInteger i=0; i<items.count; i++) {
        UITabBarItem *item = items[i];
        item.title = titleArr[i];
        item.image = [UIImage imageNamed:imageArr[i]];
        item.selectedImage = [[UIImage imageNamed:selectedImageArr[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
