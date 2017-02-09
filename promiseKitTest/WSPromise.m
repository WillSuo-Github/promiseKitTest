//
//  WSPromise.m
//  promiseKitTest
//
//  Created by ws on 2017/2/7.
//  Copyright © 2017年 ws. All rights reserved.
//

#import "WSPromise.h"

@interface WSPromise ()

@property (nonatomic, copy) void(^pBlock)(id obj);

@property (nonatomic, copy) id(^commonBlock)(id commonObj) ;
@end

@implementation WSPromise

+ (instancetype)wsPromiseWithBlock:(void (^)(void(^pBlock)(id obj)))block{
    
    WSPromise *p = [[WSPromise alloc] init];
    __block WSPromise *blockp = p;
    p.pBlock = ^(id obj){
        @autoreleasepool {
            if (blockp.commonBlock) {
                blockp.commonBlock(obj);
            }
            //主动断掉循环引用
            blockp = nil;
        }
    };
    block(p.pBlock);

    return p;
}

- (WSPromise *(^)(id))then{

    return ^WSPromise *(id obj){
        self.commonBlock = obj;
        return self;
    };
}

- (void)dealloc{
    NSLog(@"wspromise dealloc");
}

@end
