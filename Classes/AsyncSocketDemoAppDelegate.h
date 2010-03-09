//
//  AsyncSocketDemoAppDelegate.h
//  AsyncSocketDemo
//
//  Created by Ted Hayes on 3/8/10.
//  Copyright Limina.Studio 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AsyncSocketDemoViewController;

@interface AsyncSocketDemoAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    AsyncSocketDemoViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet AsyncSocketDemoViewController *viewController;

@end

