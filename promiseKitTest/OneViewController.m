//
//  OneViewController.m
//  promiseKitTest
//
//  Created by WS on 2017/2/8.
//  Copyright © 2017年 ws. All rights reserved.
//

#import "OneViewController.h"
#import "WSPromise.h"

@interface OneViewController ()

@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    
    [self customOne].then(^(id obj){
        NSLog(@"%@", obj);
    });
}

#pragma mark -
#pragma mark - customPromise
- (WSPromise *)customOne{
    return [WSPromise wsPromiseWithBlock:^(void (^pBlock)(id obj)) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            pBlock(@"123");
        });
    }];
}


- (WSPromise *)customTwo{
    return [WSPromise wsPromiseWithBlock:^(void (^pBlock)(id obj)) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            pBlock(@"222");
        });
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self dismissViewControllerAnimated:true completion:nil];
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
