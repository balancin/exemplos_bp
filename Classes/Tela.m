//
//  Tela.m
//  Untitled2
//
//  Created by Fabio Balancin on 8/26/10.
//  Copyright 2010 Umpulo. All rights reserved.
//

#import "Tela.h"


@implementation Tela

@synthesize txtNome;

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	NSString* texto = @"Teste de texto";
	NSString* texto2 = @"Teste de texto";
	NSString* texto3 = @"Teste de texto";
	NSString* texto4 = @"Teste de texto";
	NSString* texto5 = @"Teste de texto"; 
	texto = [NSString stringWithFormat:@"%@ %@ %@ %@ %@ bonito", texto, texto2, texto3, texto4, texto5];
	
	NSMutableString* textoa = [NSMutableString stringWithString:@"output start"];
	
	[textoa appendString:@"teste"];
	[textoa appendString:@"teste"];
	[textoa appendString:@"teste"];
	[textoa appendString:@"teste"];
	[textoa appendString:@"teste"];
	
	NSMutableArray* matriz = [NSMutableArray arrayWithObjects:@"1", @"2", @"3", @"4",nil];
	
	[matriz addObject:@"a"];
	[matriz addObject:@"a"];
	[matriz addObject:@"a"];
	[matriz addObject:@"a"];
	[matriz addObject:@"a"];
	
	NSDictionary* dicionario = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"bola", @"rede", @"comandos em acao", nil] forKeys:[NSArray arrayWithObjects:@"brinquedo1", @"brinquedo2", @"brinquedo3", nil]];
	
	//NSDictionary* dici2 = [NSDictionary dictionaryWithObjectsAndKeys:@"chave", [NSNumber numberWithInt:2], @"obj", @"chave", @"obj", nil];
	
	NSMutableDictionary* dici3 = [[NSMutableDictionary alloc] init];
	[dici3 setObject:[NSNumber numberWithInt:2] forKey:@"brinquedo"];
	
	int inteiro1 = 2;
	
//	if([[dici3 objectForKey:@"brinquedo"] intValue] == inteiro1)
//	if([[dici3 objectForKey:@"brinquedo"] isEqualToNumber:[NSNumber numberWithInt:inteiro1]])
//	if([[dicionario objectForKey:@"brinquedo1"] isEqualToString:@"bola"])
	
	NSLog(@"%@", [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"]);
	NSString* path = [NSString stringWithFormat:@"%@/dici.plist", [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"]];
	
	[dici3 writeToFile:path atomically:YES];
	
	NSLog(@"%i", [[dici3 objectForKey:@"brinquedo"] intValue]);
	
	NSMutableDictionary* dici4 = [NSMutableDictionary dictionaryWithContentsOfFile:path];
	
	NSLog(@"%i", [[dici4 objectForKey:@"brinquedo"] intValue]);
	
	UILabel* label = [[UILabel alloc] init];
	label.frame = CGRectMake(10, 100, 100, 30);
	
	label.text = @"Sobrenome";
	
	[self.view addSubview:label];

}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (NSString*) fale:(NSString*) mensagem {

	return mensagem;
	
}

- (void) fecha:(id)obj {

	
	
}

- (void)animationDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context {
	NSLog(@"%@", animationID);
	NSLog(@"%@", self.navigationController);
	[self.navigationController popViewControllerAnimated:YES];
}

- (void) abreLoader:(id)obj {
	
	if(retorno != nil){
		NSLog(@"A A");
		//[fundoCinza removeFromSuperview];
		[loaderzinho stopAnimating];
		
		[UIView beginAnimations:@"brancoLargo" context:NULL];
		[UIView setAnimationDuration:1.0];
		[UIView setAnimationDelegate:self];
		[UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:context:)];
		[fundoCinza setAlpha:0];
		
		[UIView commitAnimations];
		retorno = nil;
		
	} else {
		NSLog(@"%@ - %@", retorno, loaderzinho);
		[self abreLoader:obj];
	}
}

- (void) enviar {
	
	[fundoCinza setAlpha:0.6];
	[loaderzinho startAnimating];
	
	NSString* userpass = @"curso_buscape:curso123";
	NSString* tweet = txtNome.text;
	NSString* body = [NSString stringWithFormat:@"source=Buscape&status=%@", tweet];
	
	NSError* error;
	NSURLResponse* response;
	
	NSString* urlStr = [NSString stringWithFormat:@"http://%@@twitter.com/statuses/update.xml", userpass];
	NSURL* url = [NSURL URLWithString:urlStr];
	
	NSMutableURLRequest* urlRequest = [NSMutableURLRequest requestWithURL:url];
	
	if(!urlRequest)
		NSLog(@"Deu erro ai....");
	
	[urlRequest setHTTPMethod:@"POST"];
	[urlRequest setHTTPBody:[body dataUsingEncoding:NSUTF8StringEncoding]];
	[urlRequest setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
	[urlRequest setValue:@"Buscape" forHTTPHeaderField:@"X-Twitter-Client"];
	
	
	NSData* result = [NSURLConnection sendSynchronousRequest:urlRequest returningResponse:&response error:&error];
	
	retorno = [[NSString alloc] initWithData:result encoding:NSStringEncodingConversionAllowLossy];
	NSLog(@"%@", retorno); 
	
}

- (IBAction) pegaTexto {
	
	///////loaderzinho branco largo
	
	CGRect currentFrame = self.view.bounds;
	loaderzinho = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
	
	loaderzinho.frame = CGRectMake(100, 100, loaderzinho.frame.size.width, loaderzinho.frame.size.height);
	
	//[self.view addSubview:loaderzinho];
	
	fundoCinza = [[UIView alloc] initWithFrame:CGRectMake(0, 0, currentFrame.size.width, currentFrame.size.height)];
	[fundoCinza setBackgroundColor:[UIColor grayColor]];
	[fundoCinza setAlpha:0.6];
	
	[self.view addSubview:fundoCinza];
	
	[loaderzinho startAnimating];
	[fundoCinza addSubview:loaderzinho];
	
	NSLog(@"teste feito");
	
	[NSThread detachNewThreadSelector:@selector(abreLoader:) toTarget:self withObject:retorno];
	[NSThread detachNewThreadSelector:@selector(enviar) toTarget:self withObject:nil];
	
//
//	NSLog(@"Clicou %@", [self fale:txtNome.text]); 
//	//[txtNome setTextColor:[UIColor colorWithRed:91.8 green:51.8 blue:21.6 alpha:1]];
//	[self.view setBackgroundColor:[UIColor colorWithRed:0.918 green:0.518 blue:0.216 alpha:1]];
//	 
//	
//	NSString* path = [NSString stringWithFormat:@"%@/dici.plist", [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"]];
//	
//	
//	NSMutableDictionary* dici4 = [NSMutableDictionary dictionaryWithContentsOfFile:path];
//	
//	int random = arc4random()%10;
//	
//	[dici4 setObject:[NSNumber numberWithInt:random] forKey:@"brinquedo"];
//	
//	NSLog(@"%i", [[dici4 objectForKey:@"brinquedo"] intValue]);
//	
//	[dici4 writeToFile:path atomically:YES];
//	
//	NSMutableDictionary* dici5 = [NSMutableDictionary dictionaryWithContentsOfURL:[NSURL URLWithString:@"http://192.168.20.18/~fabiobalancin/dici.xml"]];
//	NSLog(@"%@", [dici5 objectForKey:@"brinquedo"]);
}

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
