//
//  TesteParser.h
//  Untitled2
//
//  Created by Fabio Balancin on 8/26/10.
//  Copyright 2010 Umpulo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Aluno.h"

@interface TesteParser : NSObject {

	NSMutableArray* alunos;
	int indexAluno;
	NSString* element;
	
}

- (id)initWithParser:(NSXMLParser *)parser;

@property(nonatomic, retain) NSMutableArray* alunos;

@end
