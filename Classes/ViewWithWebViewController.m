//
//  ViewWithWebViewController.m
//  WorshipManager
//
//  Created by Dário on 19/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ViewWithWebViewController.h"

#import "Integrantes.h"


@implementation ViewWithWebViewController

@synthesize integranteWeb;

-(id)initWithIntegranteId:(int*)integranteId; {
    if (self = [super initWithNibName:@"ViewWithWebViewController" bundle:nil]) {
		integrante = [Integrantes getIntegrantesWithidIntegrante:integranteId];
    }
    return self;
}

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
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
