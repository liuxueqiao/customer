//
//  WebService.h
//  Customer
//
//  Created by apple on 2020/4/1.
//  Copyright © 2020 qiao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WebService : NSObject

@property (nonatomic, assign) BOOL showErrorToast; // 默认YES

@property (nonatomic, strong) void(^progressBlock)(NSProgress *progress);
@property (nonatomic, strong) void(^successBlock)(NSDictionary *response);
@property (nonatomic, strong) void(^failBlock)(NSDictionary *response);
@property (nonatomic, strong) void(^errorBlock)(NSError *error);

- (void)get:(NSString *)path params:(NSDictionary *)params;
- (void)post:(NSString *)path params:(NSDictionary *)params;

@end

NS_ASSUME_NONNULL_END
