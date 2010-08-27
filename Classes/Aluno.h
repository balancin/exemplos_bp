//
//  Aluno.h
//  Untitled2
//
//  Created by Fabio Balancin on 8/26/10.
//  Copyright 2010 Umpulo. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Aluno : NSObject {

	NSString* nome;
	NSString* gender;
	
}

@property(nonatomic, retain) NSString* nome;
@property(nonatomic, retain) NSString* gender;

@end
