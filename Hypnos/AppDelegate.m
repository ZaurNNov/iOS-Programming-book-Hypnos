//
//  AppDelegate.m
//  Hypnos
//
//  Created by Zaur Giyasov on 18/04/2018.
//  Copyright © 2018 Zaur Giyasov. All rights reserved.
//

#import "AppDelegate.h"
#import "HypnosisView.h"

@interface AppDelegate () <UIScrollViewDelegate>

@property (nonatomic, strong) HypnosisView *hyView;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = [[UIViewController alloc] init];
    
    // Create CGRects for frames
    CGRect frame = [UIScreen mainScreen].bounds;
    CGRect screenRect = frame;
    CGRect scrollRect = screenRect;
    
    scrollRect.size.width *= 2.0;
    scrollRect.size.height *= 2.0;
    
    UIScrollView * scrollZoom = [[UIScrollView alloc] initWithFrame:screenRect];
    scrollZoom.pagingEnabled = NO;
    [self.window addSubview:scrollZoom];
    
    // create big
    self.hyView = [[HypnosisView alloc] initWithFrame:scrollRect];
    [scrollZoom addSubview:self.hyView];
    
    //tell the scroll view how big is the content size, so it will be possible to scroll the view
    scrollZoom.contentSize = scrollRect.size;
    
    //set the UIScrollView minimum and maximum zoom
    scrollZoom.minimumZoomScale = 0.3;
    scrollZoom.maximumZoomScale = 3.0;
    //making a delegate
    scrollZoom.delegate = self;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.hyView;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"scroll working!");
}

@end
