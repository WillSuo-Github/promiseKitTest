//
//  ViewController.m
//  promiseKitTest
//
//  Created by ws on 2017/2/3.
//  Copyright © 2017年 ws. All rights reserved.
//

#import "ViewController.h"
#import <PromiseKit/PromiseKit.h>
#import <PromiseKit/PMKUIKit.h>
#include <sys/sysctl.h>
#include <net/if.h>
#include <net/if_dl.h>
#import "OneViewController.h"


@interface ViewController ()

@property (nonatomic, copy) AnyPromise *(^promiseBlock)(id block);
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    

//    [self networkOne].then(^AnyPromise *(id obj){
//        
//        NSLog(@"%@---%@", obj, [NSThread currentThread]);
//        return [self networkTwo];
//    }).thenInBackground(^AnyPromise *(id obj){
//        
//        NSLog(@"%@---%@", obj, [NSThread currentThread]);
//        return [self networkThree];
//    }).catch(^(id obj){
//        
//        NSLog(@"%@---%@", obj, [NSThread currentThread]);
//    }).catch(^(id obj){
//        
//        NSLog(@"%@---%@", obj, [NSThread currentThread]);
//    });
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    OneViewController *oneVc = [[OneViewController alloc] init];
    [self presentViewController:oneVc animated:true completion:nil];
    
}

#pragma mark -
#pragma mark - promise

- (AnyPromise *)networkOne{

    return [AnyPromise promiseWithResolverBlock:^(void (^ _Nonnull a)(id _Nullable b)) {
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            a(@"111");
        });
    }];
}


- (AnyPromise *)networkTwo{
    
    return [AnyPromise promiseWithResolverBlock:^(void (^ _Nonnull a)(id _Nullable b)) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            a(@"2222");
        });
    }];
}

//- (AnyPromise *(^)(id block))networkTwo{
//    
//    return ^AnyPromise*(id block){
//        return [AnyPromise promiseWithResolverBlock:^(void (^ _Nonnull a)(id _Nullable b)) {
//            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//                a(block);
//            });
//        }];
//    };
//}

- (AnyPromise *)networkThree{
    
    return [AnyPromise promiseWithResolverBlock:^(void (^ _Nonnull a)(id _Nullable b)) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(6 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            a(@"333");
        });
    }];
}



@end
