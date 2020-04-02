//
//  CUSMineViewController.m
//  Customer
//
//  Created by apple on 2020/3/30.
//  Copyright © 2020 qiao. All rights reserved.
//

#import "CUSMineViewController.h"
#import "CUSMineViewModel.h"

@interface CUSMineViewController ()
@property (nonatomic, strong) CUSMineViewModel *viewModel;

@end

@implementation CUSMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.CUS_redColor;
}

- (void)bindViewModel {
    _viewModel = [CUSMineViewModel new];
    
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
