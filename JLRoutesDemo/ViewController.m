//
//  ViewController.m
//  JLRoutesDemo
//
//  Created by fanxc on 2018/11/28.
//  Copyright © 2018 fan.chason. All rights reserved.
//

#import "ViewController.h"
#import "JLRoutes.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [JLRoutes routeURL:[NSURL URLWithString:@"myapp://user/view/joeldev"]];
//    [JLRoutes routeURL:[NSURL URLWithString:@"myapp://route/joeldev"]];
    
//    [JLRoutes routeURL:[NSURL URLWithString:@"thing://foo"]];    
//    [JLRoutes routeURL:[NSURL URLWithString:@"thing://global"]];

//   [JLRoutes routeURL:[NSURL URLWithString:@"myapp://wildcard/joker"]];
    

//    [JLRoutes routeURL:[NSURL URLWithString:@"myapp://the/foo/:a/bar/:b"]];
//    [JLRoutes routeURL:[NSURL URLWithString:@"myapp://the/foo/:a"]];
//    [JLRoutes routeURL:[NSURL URLWithString:@"myapp://the/bar/:b"]];
//    [JLRoutes routeURL:[NSURL URLWithString:@"myapp://the"]];
    
//    [JLRoutes routeURL:[NSURL URLWithString:@"myapp://the(/foo/:a)(/bar/:b)"]];
    [JLRoutes routeURL:[NSURL URLWithString:@"myapp://post/halfrost?debug=true&foo=bar"]];

//    [self displayActivityControllerWithDataObject:[NSURL URLWithString:@"https://www.baidu.com/"]];
    
//    [self openAppleURL];
}


///**
// 打开Safire
// */
//- (void)openAppleURL {
//    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.baidu.com/"] options:nil completionHandler:nil];
//}
//
//
///**˜
// 在iPhone上显示活动表
//
// @param obj 图像，字符串，URL和其他几种类型的数据
// */
//- (void)displayActivityControllerWithDataObject:(id)obj {
//    UIActivityViewController * vc = [[UIActivityViewController alloc]
//                                     initWithActivityItems:@[obj] applicationActivities:nil];
//    [self presentViewController:vc animated:YES completion:nil];
//}


@end
