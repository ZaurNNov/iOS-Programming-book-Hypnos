//
//  AppDelegate.m
//  Hypnos
//
//  Created by Zaur Giyasov on 18/04/2018.
//  Copyright © 2018 Zaur Giyasov. All rights reserved.
//

#import "AppDelegate.h"
#import "HypnosisView.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = [[UIViewController alloc] init];
    
    // 5 Add ScrollView
    CGRect firstFrame = self.window.bounds;
    HypnosisView *firstView = [[HypnosisView alloc] initWithFrame:firstFrame];
    //[self.window addSubview:firstView]; //touch not work
    [self.window.rootViewController.view addSubview:firstView]; //touch work!!!
    
    // Create CGRects for frames
    CGRect screenRect = self.window.bounds;
    CGRect bigRect = screenRect;
    bigRect.size.width *= 2.0;
//    bigRect.size.height *= 2.0;
    
    // Create a screen-sized scroll view and it to the window
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:screenRect];
    scrollView.pagingEnabled = YES;
    [self.window.rootViewController.view addSubview:scrollView]; //touch work!!!
    
    //HypnosisView *hypnosisView = [[HypnosisView alloc]initWithFrame:bigRect];
    // Create a screen-sized hypnosis view and add it to the scroll view
    HypnosisView *hypnosisView = [[HypnosisView alloc]initWithFrame:screenRect];
    [scrollView addSubview:hypnosisView];
    
    // Add second screen-sized hypno view just off screen to the right
    screenRect.origin.x += screenRect.size.width;
    HypnosisView *anotherView = [[HypnosisView alloc]initWithFrame:screenRect];
    [scrollView addSubview:anotherView];

     // Tell the scroll view how big its content area is
    scrollView.contentSize = bigRect.size;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
