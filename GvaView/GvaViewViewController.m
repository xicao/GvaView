//
//  GvaViewViewController.m
//  GvaView
//
//  Created by Xi Cao on 3/08/12.
//  Copyright (c) 2012 xic. All rights reserved.
//

#import "GvaViewViewController.h"
#import "GvaView.h"

@interface GvaViewViewController ()
@property (nonatomic, weak) IBOutlet GvaView *gvaView;
@end

@implementation GvaViewViewController

@synthesize functionLabelNotifier = _functionLabelNotifier;
@synthesize gvaView = _gvaView;

# pragma mark - View Methods

- (void)setGvaView:(GvaView *)gvaView { //reflash our view every time 
    _gvaView = gvaView;
    [self.gvaView setBackgroundColor:[UIColor lightGrayColor]];
    [self.gvaView setNeedsDisplay];
}

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return UIInterfaceOrientationIsLandscape(interfaceOrientation);// only support landscape
}

@end
