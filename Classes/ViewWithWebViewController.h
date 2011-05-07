//
//  ViewWithWebViewController.h
//  WorshipManager
//
//  Created by Dário on 19/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Integrantes;

@interface ViewWithWebViewController : UIViewController {

	Integrantes *integrante;
	
	IBOutlet UIWebView *integranteWeb;
	
}

-(id)initWithIntegranteId:(int*)integranteId;

@property (nonatomic, retain) UIWebView *integranteWeb;

@end
