//
//  WebService.m
//  Customer
//
//  Created by apple on 2020/4/1.
//  Copyright © 2020 qiao. All rights reserved.
//

#import "WebService.h"
#import <AFNetworking/AFNetworking.h>
#import "Toast.h"
#import "Config.h"
#import "Loading.h"

@implementation WebService

- (instancetype)init
{
    self = [super init];
    if (self) {
        _showErrorToast = YES;
        _showLoading = YES;
    }
    return self;
}

- (void)get:(NSString *)path params:(NSDictionary *)params {
    
}

- (void)post:(NSString *)path params:(NSDictionary *)params {
    
}

#pragma mark - privite

- (void)_request:(NSString *)method parh:(NSString *)path params:(NSDictionary *)params {
    // 1.检查网络状况
    AFNetworkReachabilityManager *reachability = [AFNetworkReachabilityManager sharedManager];
    if (!reachability.reachable) {
        [Toast show:@"请检查网络连接"];
        return;
    }
    
    if (self.showLoading) {
        [Loading show];
    }
    
    // 2.请求
    NSMutableDictionary *_params = [[self _baseParams] mutableCopy];
    [_params addEntriesFromDictionary:params];
    NSString *_url = [NSString stringWithFormat:@"%@%@", BASE_URL, path];
    if ([method isEqualToString:@"get"]) {
        [self _get:_url params:_params];
    } else if ([method isEqualToString:@"post"]) {
        [self _post:_url params:_params];
    }
    
}

- (void)_get:(NSString *)url params:(NSDictionary *)params {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:url parameters:params progress:^(NSProgress * _Nonnull progress) {
        if (self.progressBlock) {
            self.progressBlock(progress);
        }
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (self.progressBlock) {
            self.progressBlock(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (self.errorBlock) {
            self.errorBlock(error);
        }
        if (self.showErrorToast) {
            [Toast show:error.description];
        }
    }];
}

- (void)_post:(NSString *)url params:(NSDictionary *)params {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", nil];
    
    [manager POST:url parameters:params progress:^(NSProgress * _Nonnull progress) {
        if (self.progressBlock) {
            self.progressBlock(progress);
        }
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (self.successBlock) {
            self.successBlock(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (self.errorBlock) {
            self.errorBlock(error);
        }
        if (self.showErrorToast) {
            [Toast show:error.description];
        }
    }];
}

- (NSDictionary *)_baseParams {
    return @{};
}

@end
