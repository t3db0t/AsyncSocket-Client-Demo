//
//  AsyncSocketDemoAppDelegate.m
//  AsyncSocketDemo
//
//  Created by Ted Hayes on 3/8/10.
//  Copyright Limina.Studio 2010. All rights reserved.
//

#import "AsyncSocketDemoAppDelegate.h"
#import "AsyncSocketDemoViewController.h"

@implementation AsyncSocketDemoAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
