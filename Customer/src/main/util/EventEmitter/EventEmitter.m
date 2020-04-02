//
//  EventEmitter.m
//  Customer
//
//  Created by apple on 2020/4/2.
//  Copyright © 2020 qiao. All rights reserved.
//

#import "EventEmitter.h"

@interface EventEmitter ()
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) void(^receiveEventBlock)(id params);

- (void)_receiveEvent:(NSNotification *)notification;

@end

@implementation EventEmitter

+ (void)emit:(NSString *)name {
    [EventEmitter emit:name params:nil];
}
+ (void)emit:(NSString *)name params:(id)params {
    [[NSNotificationCenter defaultCenter] postNotificationName:name object:params];
}

+ (EventEmitter *)addListener:(NSString *)name then:(void(^)(id params))thenBlock {
    EventEmitter *event = [EventEmitter new];
    event.name = name;
    event.receiveEventBlock = thenBlock;
    [[NSNotificationCenter defaultCenter] addObserver:event selector:@selector(_receiveEvent:) name:name object:nil];
    return event;
}

- (void)remove {
    if (self.name && self.name.length > 0) {
        [[NSNotificationCenter defaultCenter] removeObserver:self name:self.name object:nil];
    }
}
- (void)removeAllListeners {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - privite

- (void)_receiveEvent:(NSNotification *)notification {
    if (self.receiveEventBlock) {
        self.receiveEventBlock(notification.object);
    }
}

@end
