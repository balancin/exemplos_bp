//
//  TabelaDelegate.h
//  Untitled2
//
//  Created by Fabio Balancin on 8/26/10.
//  Copyright 2010 Umpulo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tela.h"
#import "Aluno.h"

@interface TabelaDelegate : UITableViewController <UITableViewDelegate> {

	NSMutableArray* entrys;

}

@property(nonatomic, retain) NSMutableArray* entrys;

@end
