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

- (IBAction) pegaTexto {
	
	NSURL* url = [NSURL URLWithString:@"http://192.168.20.18/~fabiobalancin/dici2.xml"];
	NSMutableURLRequest* urlRequest = [NSMutableURLRequest requestWithURL:url];
	[urlRequest setHTTPMethod:@"GET"];
	
	NSError* error;
	NSURLResponse* response;

	NSData* result = [NSURLConnection sendSynchronousRequest:urlRequest returningResponse:&response error:&error];
	
	NSString* retorno = [[NSString alloc] initWithData:result encoding:NSStringEncodingConversionAllowLossy];
	
	NSXMLParser* xmlparser = [[NSXMLParser alloc] initWithData:result];
	parser = [[TesteParser alloc] initWithParser:xmlparser]; 
	
	NSLog(@"%@", parser.alunos);
	
	for(int i = 0; i < [parser.alunos count]; i++){
	
		Aluno* aluno = [parser.alunos objectAtIndex:i];
		NSLog(@"%@ / %@", aluno.nome, aluno.gender);
		
	}
	
	[self dismissModalViewControllerAnimated:YES];
	
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
