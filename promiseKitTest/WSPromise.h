//
//  WSPromise.h
//  promiseKitTest
//
//  Created by ws on 2017/2/7.
//  Copyright © 2017年 ws. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WSPromise : NSObject<NSCopying>



@property (nonatomic, copy) WSPromise *(^then)(id obj);


+ (instancetype)wsPromiseWithBlock:(void(^)(void(^pBlock)(id obj)))block;

@end
