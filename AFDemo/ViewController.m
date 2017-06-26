//
//  ViewController.m
//  AFDemo
//
//  Created by quangang on 2017/6/26.
//  Copyright © 2017年 LQG. All rights reserved.
//

#import "ViewController.h"
#import "NetWork.h"

static NSString *testURLString = @"http://www.jianshu.com/p/fafc67475c73";          //测试链接
static NSString *testURLString1 = @"http://www.jianshu.com";                         //测试链接

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [NetWork getRequestWithURL:[NSURL URLWithString:testURLString1] completionHandler:^(NSString *data, NSURLResponse *response, NSError *error) {
        NSLog(@"%@", data);
    }];
    
    [NetWork pushRequestWithURL:[NSURL URLWithString:testURLString1] postBody:@"" completionHandler:^(NSString *data, NSURLResponse *response, NSError *error) {
        NSLog(@"%@", data); 
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
