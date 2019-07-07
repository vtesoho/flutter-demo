//
//  ViewController.m
//  FlutterHybridiOSB
//
//  Created by 李奕权 on 2019/7/7.
//  Copyright © 2019 李奕权. All rights reserved.
//

#import <Flutter/Flutter.h>
#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self action:@selector(handleButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"flutter" forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor redColor]];
    button.frame = CGRectMake(80, 210, 160, 40);
    [self.view addSubview:button];
    
}
- (void)handleButtonAction {
    //以一个完整页面打开Flutter模块
    FlutterViewController *flutterViewController = [FlutterViewController new];
    
    [flutterViewController setInitialRoute:@"{name:'devio',dataList:['aa','bb',''cc]}"];
    
    [self presentViewController:flutterViewController animated:true completion:nil];
//    self.view=flutterViewController.view;
}
    

@end
