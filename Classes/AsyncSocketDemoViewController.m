//
//  AsyncSocketDemoViewController.m
//  AsyncSocketDemo
//
//  Created by Ted Hayes on 3/8/10.
//  Copyright Limina.Studio 2010. All rights reserved.
//

#import "AsyncSocketDemoViewController.h"
//#import "AsyncSocket.h"

@implementation AsyncSocketDemoViewController

@synthesize mySocket;

// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
		[self retain];
    }
    return self;
}

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	mySocket = [[AsyncSocket alloc] initWithDelegate:self];
	
	NSError *err;
	[mySocket connectToHost:@"crowsnest" onPort:6600 error:&err];
	[mySocket retain];
}
/*
- (void) awakeFromNib {
	NSLog(@"awakeFromNib");
	//[pauseButton setDelegate:self];
}
 */

-(void)onSocket:(AsyncSocket *)sock didConnectToHost:(NSString *)host port:(UInt16)port {
	NSLog(@"AsyncSocket didConnectToHost: %@ port: %d",host, port);
	//[sock readDataToData:[AsyncSocket CRLFData] withTimeout:-1.0 tag:0];
	[sock readDataWithTimeout:0.5 tag:0];
	
	//NSString *welcomeMsg = @"currentsong\r\n"; 
	NSData *writeData = [@"currentsong\r\n" dataUsingEncoding:NSUTF8StringEncoding]; 
	[sock writeData:writeData withTimeout:-1 tag:0];
	[sock readDataWithTimeout:0.5 tag:0];
	//[mySocket readDataToData:[AsyncSocket CRLFData] withTimeout:-1.0 tag:0];
	
	//NSLog(@"1mySocket: %@", mySocket);
	//mySocket = sock;
	//NSLog(@"2mySocket: %@", mySocket);
}

-(void)onSocket:(AsyncSocket *)sock didReadData:(NSData*)data withTag:(long)tag {
	//NSString* result;
	NSString* result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
	NSLog(@"got data: %@", result);
}

- (void)sendPause {
	NSLog(@"mySocket: %@", mySocket);
	//NSString *welcomeMsg = @"pause\r\n"; 
	NSData *writeData = [@"pause\r\n" dataUsingEncoding:NSUTF8StringEncoding]; 
	[mySocket writeData:writeData withTimeout:-1 tag:0];
	[mySocket readDataWithTimeout:0.5 tag:0];
	NSLog(@"mySocket: %@", mySocket);
}

- (IBAction)touchPauseButton:(id)sender {
	NSLog(@"touchPauseButton");
	[self sendPause];
}

-(void)onSocketDidDisconnect:(AsyncSocket *)sock {
	NSLog(@"onSocketDidDisconnect: sock: %@",sock);
}

-(void)onSocket:(AsyncSocket *)sock willDisconnectWithError:(NSError *)err {
	NSLog(@"onSocket:willDisconnectWithError: %@",err);
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	NSLog(@"viewDidUnload");
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
	NSLog(@"viewController dealloc");
	[mySocket release];
	[self release];
    [super dealloc];
}

@end
