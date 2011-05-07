//
//  NaipesTableViewController.h
//  WorshipManager
//
//  Created by Dário on 11/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Naipes;


@interface NaipesTableViewController : UITableViewController {
	
	NSMutableArray *allNaipes;
	
	NSMutableArray *allIntegrantesIdNaipe;
	
	Naipes *naipeSection;

}

@end
