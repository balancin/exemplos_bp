//
//  TesteParser.m
//  Untitled2
//
//  Created by Fabio Balancin on 8/26/10.
//  Copyright 2010 Umpulo. All rights reserved.
//

#import "TesteParser.h"


@implementation TesteParser

@synthesize alunos;

- (id)initWithParser:(NSXMLParser *)parser {
	self = [super init];
	
	alunos = [[NSMutableArray alloc] init];
	indexAluno = 0;
	
	[parser setDelegate:self];
	[parser parse];
	
	return self;
}

- (void)parserDidStartDocument:(NSXMLParser *)parser {

	NSLog(@"Comecei ler");
	
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
	
	if([element isEqualToString:@"aluno"]){
	
		NSLog(@"%i aluno %@", indexAluno, string);
		Aluno* aluno = [alunos objectAtIndex:indexAluno];
		aluno.nome = string;
		
	}
	
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName attributes:(NSDictionary *)attributeDict {
	
	NSLog(@"%@ - %@", elementName, [attributeDict objectForKey:@"gender"]);

	if([elementName isEqualToString:@"aluno"]){
	
		Aluno* aluno = [[Aluno alloc] init];
		aluno.gender = [attributeDict objectForKey:@"gender"];
		[alunos addObject:aluno];
		
	}
	
	element = elementName;
	
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
	
	if([elementName isEqualToString:@"aluno"]){
		indexAluno++;
	}
	
}

- (void)parser:(NSXMLParser *)parser foundAttributeDeclarationWithName:(NSString *)attributeName forElement:(NSString *)elementName type:(NSString *)type defaultValue:(NSString *)defaultValu {

	
	
}
@end