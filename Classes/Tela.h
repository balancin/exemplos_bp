//
//  Tela.h
//  Untitled2
//
//  Created by Fabio Balancin on 8/26/10.
//  Copyright 2010 Umpulo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TesteParser.h"

@interface Tela : UIViewController {

	IBOutlet UITextField* txtNome;
	TesteParser* parser;
	UIActivityIndicatorView* loaderzinho;
	NSString* retorno;
	UIView* fundoCinza;
	
}

- (NSString*) fale:(NSString*) mensagem;
- (IBAction) pegaTexto;

@property(nonatomic, retain) IBOutlet UITextField* txtNome;

@end
