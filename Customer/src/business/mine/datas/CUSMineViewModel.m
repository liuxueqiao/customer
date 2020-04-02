//
//  CUSMineViewModel.m
//  Customer
//
//  Created by apple on 2020/4/2.
//  Copyright © 2020 qiao. All rights reserved.
//

#import "CUSMineViewModel.h"
#import "NetworkHeader.h"

@implementation CUSMineViewModel

- (void)getUserData {
    WebService *web = [WebService new];
    web.successBlock = ^(NSDictionary * _Nonnull response) {
        
    };
    web.failBlock = ^(NSDictionary * _Nonnull response) {
        
    };
    web.errorBlock = ^(NSError * _Nonnull error) {
        
    };
    [web post:kUserInfo params:@{}];
}

@end
