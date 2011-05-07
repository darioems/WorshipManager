//
//  IntegrantesTableViewController.h
//  WorshipManager
//
//  Created by Dário on 11/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface IntegrantesTableViewController : UITableViewController <UISearchBarDelegate> {

	NSMutableArray *allIntegrantes;
	
	//---search--- 
	IBOutlet UISearchBar *searchBar; 
	BOOL isSearchOn; 
	BOOL canSelectRow; 
	NSMutableArray *listaDosIntegrantes; 
	NSMutableArray *searchResult;
	
}

@property (nonatomic,retain) NSMutableArray *allIntegrantes;

//---search---
@property (nonatomic, retain) UISearchBar *searchBar; 

- (void) doneSearching: (id)sender; 
- (void) searchIntegrantesTableView;

@end
