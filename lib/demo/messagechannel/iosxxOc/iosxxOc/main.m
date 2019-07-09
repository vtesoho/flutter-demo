//
//  main.m
//  iosxxOc
//
//  Created by 李奕权 on 2019/7/9.
//  Copyright © 2019 李奕权. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "RPoing.h"
#import "SPrint.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        
        RPoing* rp1 = [[RPoing alloc] init];

        rp1.x = 10;
        rp1.y = 20;

        [rp1 print];
        
        //拷贝
        RPoing* rp2 = rp1;
        rp2.x = 20;
        rp2.y = 40;
        
        [rp2 print];
        
        
//        SPrint sss1;
//        sp1.x = 100;

        printf("dsfsdfdsf");
        NSString *strFormat = [NSString stringWithFormat:@"我的名字是 %@", NSHomeDirectory()];
        NSLog(@"[%@]",strFormat);
        
//        SPrint sp2;
//        sp2.x = 10;
//        sp2.y = 330;
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
