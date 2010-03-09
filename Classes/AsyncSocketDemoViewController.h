//
//  AsyncSocketDemoViewController.h
//  AsyncSocketDemo
//
//  Created by Ted Hayes on 3/8/10.
//  Copyright Limina.Studio 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AsyncSocket.h"
//#import "AsyncSocketDelegate.h"

@interface AsyncSocketDemoViewController : UIViewController {
	AsyncSocket *mySocket;
	IBOutlet UIButton* pauseButton;
	IBOutlet UITextView* resultsText;
	IBOutlet UILabel* currentTrack;	
}
@property(retain, nonatomic) AsyncSocket *mySocket;

- (IBAction) touchPauseButton:(id)sender;

@end

