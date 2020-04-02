//
//  CUSMineViewController.m
//  Customer
//
//  Created by apple on 2020/3/30.
//  Copyright © 2020 qiao. All rights reserved.
//

#import "CUSMineViewController.h"
#import "CUSMineViewModel.h"
#import "EmptyView.h"

@interface CUSMineViewController ()
@property (nonatomic, strong) CUSMineViewModel *viewModel;
@property (nonatomic, strong) EventEmitter *emitter;
@property (nonatomic, strong) EmptyView *empty;
@end

@implementation CUSMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _emitter = [EventEmitter addListener:kLoginSuccessNotification then:^(id  _Nonnull params) {
        [Toast show:[NSString stringWithFormat:@"hello 你好呀！嗨%@", params]];
    }];
    
    _empty = [EmptyView showAtView:self.view];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.empty remove];
    });
}

- (void)bindViewModel {
    _viewModel = [CUSMineViewModel new];
    
}

- (void)dealloc {
    [self.emitter remove];
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
