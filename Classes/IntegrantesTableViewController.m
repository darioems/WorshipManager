//
//  IntegrantesTableViewController.m
//  WorshipManager
//
//  Created by Dário on 11/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "IntegrantesTableViewController.h"

#import "Integrantes.h"

#import "ViewWithWebViewController.h"


@implementation IntegrantesTableViewController

@synthesize allIntegrantes;

@synthesize searchBar;


#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {
	
	allIntegrantes = [Integrantes getAllIntegrantes];
	
	UIBarButtonItem *backBarButtonItem = [[UIBarButtonItem alloc] 
										  initWithTitle:@"Voltar" 
										  style:UIBarButtonItemStyleBordered 
										  target:nil 
										  action:nil];
	self.navigationItem.backBarButtonItem = backBarButtonItem;
	
	//---display the searchbar--- 
	self.tableView.tableHeaderView = searchBar; 
	searchBar.autocorrectionType = UITextAutocorrectionTypeYes;
	
	//---copy all the movie titles in the dictionary into the listOfMovies array--- 
	
	listaDosIntegrantes = [[NSMutableArray alloc] init];
	//NSInteger n = 0;
	//NSLog(@"Número de INtegrantes: %i", [allIntegrantes count]);
	
	for (NSInteger n= 0; n <=[allIntegrantes count] - 1; n++) {
		Integrantes *nomeIntegranteAux = [allIntegrantes objectAtIndex:n];
		[listaDosIntegrantes addObject:nomeIntegranteAux.nomeIntegrante];
		//NSLog(@"%i, %@", n,[listaDosIntegrantes objectAtIndex:n]);		
	}
	
	//---used for storing the search result--- 
	searchResult = [[NSMutableArray alloc] init];
	isSearchOn = NO;
	
	canSelectRow = YES;
	
	[super viewDidLoad];
	
	[super setTitle:@"Integrantes"];
	
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

//---fired when the user taps on the searchbar--- 
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
	
	isSearchOn = YES; 
	
	canSelectRow = NO; 
	
	self.tableView.scrollEnabled = NO;
	
	//---add the Done button at the top--- 
	self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc]
											   initWithBarButtonSystemItem:UIBarButtonSystemItemDone 
											   target:self 
											   action:@selector(doneSearching:)] autorelease];
}


//---done with the searching--- 
- (void) doneSearching:(id)sender {
	isSearchOn = NO; 
	canSelectRow = YES; 
	self.tableView.scrollEnabled = YES; 
	self.navigationItem.rightBarButtonItem = nil;
	
	//---hides the keyboard--- 
	[searchBar resignFirstResponder];
	
	//---refresh the TableView--- 
	[self.tableView reloadData];
}

//---fired when the user types something into the searchbar--- 
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
	
	//---if there is something to search for--- 
	if ([searchText length] > 0) {
		isSearchOn = YES; 
		canSelectRow = YES; 
		self.tableView.scrollEnabled = YES; 
		[self searchIntegrantesTableView];
	} else {
	//---nothing to search--- 
		isSearchOn = NO; 
		canSelectRow = NO; 
		self.tableView.scrollEnabled = NO;
	} 
	
	[self.tableView reloadData];
}

//---performs the searching using the array of movies---

- (void) searchIntegrantesTableView {

	//---clears the search result--- 
	
	[searchResult removeAllObjects];
	
	for (NSString *str in listaDosIntegrantes) {
		NSRange titleResultsRange = [str rangeOfString:searchBar.text options:NSCaseInsensitiveSearch];
		if (titleResultsRange.length > 0) [searchResult addObject:str];
	}
}

//---fired when the user taps the Search button on the keyboard--- 
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
	[self searchIntegrantesTableView]; 
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

	if (isSearchOn) 
		return 1;
	else
		//[allNaipes count];
		return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{ 
	
	NSString *msg = [[NSString alloc] initWithFormat:@"Total de Integrantes %i", [allIntegrantes count]];
	
	return msg;
}

/*
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
*/
/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}
*/
/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/


#pragma mark -
#pragma mark Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
	
	if (isSearchOn) { 
		return [searchResult count];
	} 
	else {
	//	NSString *year = [years objectAtIndex:section]; 
	//	NSArray *movieSection = [movieTitles objectForKey:year]; 
	//	return [movieSection count];
		return [allIntegrantes count];
	}
	
    //return [allIntegrantes count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
		[cell setAccessoryType:UITableViewCellAccessoryDetailDisclosureButton];
    }
    
    // Configure the cell...
	
	if (isSearchOn) { 
		NSString *cellValue = [searchResult objectAtIndex:indexPath.row]; 
		cell.textLabel.text = cellValue;
	} else {
		Integrantes *nomeIntegranteAux = [allIntegrantes objectAtIndex:indexPath.row];
		cell.textLabel.text = nomeIntegranteAux.nomeIntegrante;
		UIImage *image = [UIImage imageNamed:@"person.png"]; 
		cell.imageView.image = image;
	}
    
    return cell;
}

//- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
//	return allIntegrantes;
//}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }   
}
*/


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
    /*
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
    // ...
    // Pass the selected object to the new view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
    [detailViewController release];
    */
	
	Integrantes *integSelect = [allIntegrantes objectAtIndex:indexPath.row]; 
	
	ViewWithWebViewController *viewWebView =  [[ViewWithWebViewController alloc] init];
	
	
	/*NSString *msg = [[NSString alloc] initWithFormat:@"Você selecionou %@", integSelect.nomeIntegrante];
	
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Integrante Selecionado" 
													message:msg 
												   delegate:self 
										  cancelButtonTitle:@"OK" 
										  otherButtonTitles:nil];
						  
						  
						  
	[alert show]; 
	[alert release];*/
	
	
	[integSelect release]; 
	//[msg release];
}


- (NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	return [indexPath row] % 1;
	
	//return 3;
}

#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}


- (void)dealloc {
	[searchResult release];
	[listaDosIntegrantes release];
	[allIntegrantes release];
    [super dealloc];
}


@end

