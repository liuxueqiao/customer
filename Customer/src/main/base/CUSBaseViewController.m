//
//  CUSBaseViewController.m
//  Customer
//
//  Created by apple on 2020/3/30.
//  Copyright © 2020 qiao. All rights reserved.
//

#import "CUSBaseViewController.h"

@interface CUSBaseViewController ()

@end

@implementation CUSBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self bindViewModel];
}

#pragma mark - viewModel
- (void)bindViewModel {
    // subclass implementation
}

#pragma mark - reloadData
- (void)reloadDatas:(id)params {
    // subclass implementation
}
- (void)reloadView:(NSInteger)index params:(id)params {
    NSInteger _index = [self.navigationController.viewControllers indexOfObject:self] + index;
    if (self.navigationController.viewControllers.count > _index) {
        CUSBaseViewController *vc = self.navigationController.viewControllers[_index];
        if ([vc performSelector:@selector(reloadDatas:)]) {
            [vc reloadDatas:params];
        }
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
