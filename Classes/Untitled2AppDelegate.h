//
//  Untitled2AppDelegate.h
//  Untitled2
//
//  Created by Fabio Balancin on 8/26/10.
//  Copyright Umpulo 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Teste.h"
#import "Tela.h"

@class Untitled2ViewController;

@interface Untitled2AppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    Untitled2ViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet Untitled2ViewController *viewController;

@end

