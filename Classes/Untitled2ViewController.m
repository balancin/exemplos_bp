//
//  Untitled2ViewController.m
//  Untitled2
//
//  Created by Fabio Balancin on 8/26/10.
//  Copyright Umpulo 2010. All rights reserved.
//

#import "Untitled2ViewController.h"

@implementation Untitled2ViewController



/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	NSLog(@"começou %i %@", 34, @"teste");
	
	//LatLonListZipCode* myWebService = [[LatLonListZipCode alloc] init];
	//id result = [myWebService callMethodThatTakesInt:1];
	
	abreBt = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	abreBt.titleLabel.text = @"Abre";
	
	[abreBt addTarget:self action:@selector(abre) forControlEvents:UIControlEventTouchUpInside];
	
	CGRect currentFrame = self.view.bounds;
	
	NSLog(@"%f", currentFrame.size.width);
	
	abreBt.frame = CGRectMake((currentFrame.size.width/2)-50,
							  (currentFrame.size.height/2)-20,100,40);
	
	[self.view addSubview:abreBt];
	
}
											
-(void) abre {
	
	NSLog(@"Abriu");
	
	[self presentModalViewController:[[NavegacaoController alloc] init] animated:YES];
	
}

// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
//	NSLog(@"Vira vira");
//	
//	CGRect currentFrame = self.view.bounds;
//	
//	NSLog(@"%f", currentFrame.size.width);
//	
//	abreBt.frame = CGRectMake((currentFrame.size.width/2)-50,
//							  (currentFrame.size.height/2)-20,100,40);
//	
    return YES;//(interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
