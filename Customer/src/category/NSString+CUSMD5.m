//
//  NSString+CUSMD5.m
//  Customer
//
//  Created by apple on 2020/4/1.
//  Copyright © 2020 qiao. All rights reserved.
//

#import "NSString+CUSMD5.h"
#import <CommonCrypto/CommonCrypto.h>

@implementation NSString (CUSMD5)

- (NSString *)md5String {
    return [self _md5StringWithData:[self dataUsingEncoding:NSUTF8StringEncoding]];
}

- (NSString *)_md5StringWithData:(NSData *)data {
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(data.bytes, (CC_LONG)data.length, result);
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

@end
