//
//  ViewController.m
//  Dec6
//
//  Created by Leonardo Lavega on 12/12/12.
//  Copyright (c) 2012 Leonardo Lavega. All rights reserved.
//

#import "ViewController.h"
#import "View.h"

@interface ViewController ()

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	CGRect frame = [UIScreen mainScreen].applicationFrame;
	self.view = [[View alloc] initWithFrame: frame withController: self];
	
	displayLink = [CADisplayLink displayLinkWithTarget: self.view selector: @selector(move:)];
	
	//Call move: every time the display is refreshed.
	displayLink.frameInterval = 1;
	
	NSRunLoop *loop = [NSRunLoop currentRunLoop];
	[displayLink addToRunLoop: loop forMode: NSDefaultRunLoopMode];
	
	
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) dealloc {
	NSRunLoop *loop = [NSRunLoop currentRunLoop];
	[displayLink removeFromRunLoop: loop forMode: NSDefaultRunLoopMode];
}

- (BOOL)shouldAutorotate {
    return NO;
}

- (NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskAll;
}


@end
