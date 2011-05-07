//
//  IntegrantesNaipeTableViewController.h
//  WorshipManager
//
//  Created by Dário on 11/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface IntegrantesNaipeTableViewController : UITableViewController {
	
	NSMutableArray *allIntegrantesIdNaipe;

}

-(id)initWithIntegrantesIdNaipe:(int*)idNaipe;

@end
