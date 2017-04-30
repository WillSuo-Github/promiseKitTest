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


- (id)copyWithZone:(NSZone *)zone{
    
    WSPromise *p = [[WSPromise alloc] init];
    p.pBlock = [self.pBlock copy];
    p.commonBlock = [self.commonBlock copy];
    p.then = [self.then copy];
    return p;
    
}

+ (instancetype)wsPromiseWithBlock:(void (^)(void(^pBlock)(id obj)))block{
    
    __block WSPromise *p = [[WSPromise alloc] init];
    p.pBlock = ^(id obj){
  
        if (p.commonBlock) {
            p.commonBlock(obj);
        }
        //主动断掉循环引用
        p = nil;
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
