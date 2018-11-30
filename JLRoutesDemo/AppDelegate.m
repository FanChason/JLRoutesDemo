//
//  AppDelegate.m
//  JLRoutesDemo
//
//  Created by fanxc on 2018/11/28.
//  Copyright © 2018 fan.chason. All rights reserved.
//

#import "AppDelegate.h"
#import "JLRoutes.h"
#import "JLRRouteDefinition.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    JLRoutes *routes = [JLRoutes globalRoutes];
    [routes addRoute:@"user/view/:userID" handler:^BOOL(NSDictionary<NSString *,NSString *> * _Nonnull parameters) {
        NSLog(@"--1--parameters : %@",parameters);

        NSString *userID = parameters[@"userID"];
        NSLog(@"userID : %@",userID);

        return YES;
    }];
    
    JLRoutes.globalRoutes[@"/route/:param"] = ^BOOL(NSDictionary *parameters) {
        NSLog(@"--2--parameters : %@",parameters);
        return YES;
    };
    
    
    // property设置为1，当两个路由都可以接受跳转的时候，优先级高的先跳
    [[JLRoutes globalRoutes] addRoute:@"/:object/:action/:primaryKey" priority:1 handler:^BOOL(NSDictionary<NSString *,id> * _Nonnull parameters) {
        
        NSLog(@"--3--parameters : %@",parameters);
        
        NSString *object = parameters[@"object"];
        NSString *action = parameters[@"action"];
        NSString *primaryKey = parameters[@"primaryKey"];
        
        NSLog(@"object : %@",object);
        NSLog(@"action : %@",action);
        NSLog(@"primaryKey : %@",primaryKey);
        
        
        // stuff
        return YES;
        
    }];
    
    [[JLRoutes globalRoutes] addRoute:@"/:object/:action" handler:^BOOL(NSDictionary *parameters) {

        NSLog(@"--4--parameters : %@",parameters);

        NSString *object = parameters[@"object"];
        NSString *action = parameters[@"action"];

        NSLog(@"object : %@",object);
        NSLog(@"action : %@",action);


        // stuff
        return YES;
    }];
    
    [[JLRoutes globalRoutes] addRoute:@"/foo" handler:^BOOL(NSDictionary *parameters) {
        // This block is called if the scheme is not 'thing' or 'stuff' (see below)
        NSLog(@"global--foo--parameters : %@",parameters);

        return YES;
    }];
    
    [[JLRoutes routesForScheme:@"thing"] addRoute:@"/foo" handler:^BOOL(NSDictionary *parameters) {
        // This block is called for thing://foo
        NSLog(@"thing--foo--parameters : %@",parameters);

        return YES;
    }];
    
    /*
     这告诉JLRoutes，如果URL无法在thing方案中路由（也就是说，它开始thing:但没有找到合适的路由），请尝试通过在全局路由方案中查找匹配的路由来恢复。将该属性设置为后YES，URL thing://global将路由到/ global块
     */
    [JLRoutes routesForScheme:@"thing"].shouldFallbackToGlobalRoutes = YES;
    
    [[JLRoutes routesForScheme:@"stuff"] addRoute:@"/foo" handler:^BOOL(NSDictionary *parameters) {
        // This block is called for stuff://foo
        NSLog(@"stuff--foo--parameters : %@",parameters);

        return YES;
    }];
    
    [[JLRoutes globalRoutes] addRoute:@"/global" handler:^BOOL(NSDictionary *parameters) {
        NSLog(@"global--parameters : %@",parameters);

        return YES;
    }];
    
    [[JLRoutes globalRoutes] addRoute:@"/wildcard/*" handler:^BOOL(NSDictionary *parameters) {
        NSLog(@"wildcard--parameters : %@",parameters);
        
        NSArray *pathComponents = parameters[JLRouteWildcardComponentsKey];
        NSLog(@"pathComponents : %@",pathComponents);

        if ([pathComponents count] > 0 && [pathComponents[0] isEqualToString:@"joker"]) {
            // the route matched; do stuff
            return YES;
        }
        
        // not interested unless the joker's in it
        return NO;
    }];
    
    [[JLRoutes globalRoutes] addRoute:@"/the(/foo/:a)(/bar/:b)" handler:^BOOL(NSDictionary *parameters) {
        NSLog(@"/the(/foo/:a)(/bar/:b)--parameters : %@",parameters);
        
        return YES;
    }];
    
    NSLog(@"allRoutes-----------------: %@", [JLRoutes allRoutes]);
    NSLog(@"routes-----------------: %@", routes.routes);
    NSLog(@"globalRoutes-----------------: %@", routes);

    return YES;
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
    NSLog(@"url : %@", url);
    return [JLRoutes routeURL:url];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
