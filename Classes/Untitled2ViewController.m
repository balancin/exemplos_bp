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

- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration {

	NSLog(@"%fx %fy %fz", acceleration.x, acceleration.y, acceleration.z);
	
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	NSLog(@"começou %i %@", 34, @"teste");
	
//	NSString* urlStr = [[NSBundle mainBundle] p ;
//	NSURL* url = [NSURL fileURLWithPath:urlStr];
//	MPMoviePlayerController* myMovie = [[MPMoviePlayerController alloc] initWithContentURL:url];
//	[myMovie setMovieControlMode:MPMovieControlModeHidden];
//	myMovie.scalingMode = MPMovieScalingModeAspectFit;
////	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(acabaLogo:) name:@"MPMoviePlayerPlaybackDidFinishNotification" object:myMovie];
//	[myMovie play];
//	
//	myMovie.view.frame = CGRectMake(50, 50, myMovie.view.frame.size.width, myMovie.view.frame.size.height);
//	
//	[self.view addSubview:myMovie.view];
//	
	//////////////
	
	[[UIAccelerometer sharedAccelerometer] setUpdateInterval:(1/25)];
	[[UIAccelerometer sharedAccelerometer] setDelegate:self];
	
	self.view.userInteractionEnabled = YES;
	self.view.multipleTouchEnabled = YES;
	
	//LatLonListZipCode* myWebService = [[LatLonListZipCode alloc] init];
	//id result = [myWebService callMethodThatTakesInt:1];
	
	abreBt = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	abreBt.titleLabel.text = @"Abre";
	
	[abreBt addTarget:self action:@selector(abre) forControlEvents:UIControlEventTouchUpInside];
	
	CGRect currentFrame = self.view.bounds;
	
	NSLog(@"%f", currentFrame.size.width);
	
	abreBt.frame = CGRectMake((currentFrame.size.width/2)-50,
							  (currentFrame.size.height/2)-20,100,40);
	
	//[self.view addSubview:abreBt];
	
//	UIImage* imagem = [UIImage imageNamed:@"lindsaylohan.jpg"];
//	imagemView = [[UIImageView alloc] initWithImage:imagem];
//	imagemView.frame = CGRectMake(50, 50, imagem.size.width, imagem.size.height);
//	[self.view addSubview:imagemView];
	
	//[self aumenta];
	
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {

	
	NSLog(@"Tocou em mim %@", [touches allObjects]);
	UITouch *touch = [touches anyObject]; 
	//CGPoint pointOne = [[touches1 objectAtIndex:0] locationInView:self];
	
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	
	UITouch *touch = [touches anyObject];
	CGPoint point = [[[touches allObjects] objectAtIndex:0] locationInView:self.view];
//	CGPoint point2 = [[[touches allObjects] objectAtIndex:1] locationInView:self.view];
//	NSLog(@"Tocou em mim... %f %f | %f %f", point.x, point.y, point2.x, point2.y);
	
}

- (void) aumenta {
	
	[UIView beginAnimations:@"brancoLargo" context:NULL];
	[UIView setAnimationDuration:1.0];
	[UIView setAnimationDelegate:self];
	//[UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:context:)];
	//CGAffineTransform transform = CGAffineTransformMake(100, 50, 100, 100, 50, 50);
	CGAffineTransform transform = CGAffineTransformMakeRotation(360*(M_PI/180));
	//CGAffineTransform transform = CGAffineTransformMakeTranslation(imagemView.frame.size.width, 0.0);
	//transform = CGAffineTransformScale(transform, 4, 4);
	imagemView.transform = transform;
	
	[UIView commitAnimations];
	
}

- (void)animationDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context {
	NSLog(@"%@", animationID);
	NSLog(@"%@", self.navigationController);
	
	[UIView beginAnimations:@"brancoLargo" context:NULL];
	[UIView setAnimationDuration:1.0];
	[UIView setAnimationDelegate:self];
	//[UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:context:)]; 
	CGAffineTransform transform = CGAffineTransformMakeTranslation(imagemView.frame.size.width, 0.0);
	transform = CGAffineTransformScale(transform, 0, 0);
	imagemView.transform = transform;
	
	[UIView commitAnimations];
	
	//[self aumenta];
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
