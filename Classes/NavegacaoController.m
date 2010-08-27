    //
//  NavegacaoController.m
//  Untitled2
//
//  Created by Fabio Balancin on 8/26/10.
//  Copyright 2010 Umpulo. All rights reserved.
//

#import "NavegacaoController.h"


@implementation NavegacaoController

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
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
	
	[self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"lindsaylohan.jpg"]]];
	
	
	NSURL* url = [NSURL URLWithString:@"http://192.168.20.18/~fabiobalancin/dici2.xml"];
	NSMutableURLRequest* urlRequest = [NSMutableURLRequest requestWithURL:url];
	[urlRequest setHTTPMethod:@"GET"];
	
	NSError* error;
	NSURLResponse* response;
	
	NSData* result = [NSURLConnection sendSynchronousRequest:urlRequest returningResponse:&response error:&error];
	
	NSString* retorno = [[NSString alloc] initWithData:result encoding:NSStringEncodingConversionAllowLossy];
	
	NSXMLParser* xmlparser = [[NSXMLParser alloc] initWithData:result];
	TesteParser* parser = [[TesteParser alloc] initWithParser:xmlparser]; 
	
	NSLog(@"%@", parser.alunos);
	

	
	CGRect currentFrame = self.view.bounds;
	UITableView* tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, currentFrame.size.width, currentFrame.size.height) style:UITableViewStylePlain];
	
	TabelaDelegate* delegate = [[TabelaDelegate alloc] init];
	delegate.tableView = tableView;
	delegate.entrys = parser.alunos;
	
	UIButton* abreBt = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	abreBt.titleLabel.text = @"Abre";
	
	[abreBt addTarget:self action:@selector(abre) forControlEvents:UIControlEventTouchUpInside];
	
	NSLog(@"%f", currentFrame.size.width);
	
	abreBt.frame = CGRectMake((currentFrame.size.width/2)-50,
							  (currentFrame.size.height/2)-20,100,40);
	
	UIViewController *viewController = [[[UIViewController alloc] init] autorelease];
	[viewController.view addSubview:abreBt];
	
	navigationController = [[UINavigationController alloc] initWithRootViewController:delegate];
	[self.view addSubview:navigationController.view];
	
}

-(void) abre {

	[navigationController pushViewController:[[NavegacaoController alloc] init] animated:YES];
	
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
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
