//
//  NaipesTableViewController.m
//  WorshipManager
//
//  Created by Dário on 11/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "NaipesTableViewController.h"

#import "Naipes.h"

#import "NaipesViewController.h"

#import "IntegrantesNaipeTableViewController.h"

#import "Integrantes.h"

#import "IntegranteNaipe.h"



@implementation NaipesTableViewController


#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {
    [super viewDidLoad];
	[super setTitle:@"Naipes"];
	
	allNaipes = [Naipes getAllNaipes];
	
	UIBarButtonItem *backBarButtonItem = [[UIBarButtonItem alloc] 
										  initWithTitle:@"Voltar" 
										  style:UIBarButtonItemStyleBordered 
										  target:nil 
										  action:nil];
	self.navigationItem.backBarButtonItem = backBarButtonItem;

    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return [allNaipes count];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
	
	naipeSection = [allNaipes objectAtIndex:section];
	
	allIntegrantesIdNaipe = [IntegranteNaipe getAllIntegrantesWithIdNaipe:naipeSection.idNaipe];
	
    return [allIntegrantesIdNaipe count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{ 
	
	
	naipeSection = [allNaipes objectAtIndex:section];
	
	return naipeSection.naipe;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
//---display "by Denzel Washington" as the footer--- 
	
	naipeSection = [allNaipes objectAtIndex:section];
	
	allIntegrantesIdNaipe = [IntegranteNaipe getAllIntegrantesWithIdNaipe:naipeSection.idNaipe];
	
	NSString *msg = [[NSString alloc] initWithFormat:@"Total de Integrantes - %@: %i",naipeSection.naipe, [allIntegrantesIdNaipe count] ];
	
	return msg;
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
	
	naipeSection = [allNaipes objectAtIndex:indexPath.section];
	
	allIntegrantesIdNaipe = [IntegranteNaipe getAllIntegrantesWithIdNaipe:naipeSection.idNaipe];
	
	Integrantes *nomeIntegranteAux = [allIntegrantesIdNaipe objectAtIndex:indexPath.row];
	
//	Naipes *naipeAux = [allNaipes objectAtIndex:indexPath.row];
	
	cell.textLabel.text = nomeIntegranteAux.apelidoIntegrante;
    
    return cell;
}

//- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
	
//	return allNaipes;
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
   
	//Naipes *naipeSelecionado = [allNaipes objectAtIndex:indexPath.row];
	
	//IntegrantesNaipeTableViewController *view = [[IntegrantesNaipeTableViewController alloc] initWithIntegrantesIdNaipe:naipeSelecionado.idNaipe];
		
	//NaipesViewController *view = [[NaipesViewController alloc] initWithIdNaipe:naipeSelecionado.idNaipe];
	
	//[self.navigationController pushViewController:view animated:YES];
	
	NSString *msg = [[NSString alloc] initWithFormat:@"Você selecionou %i", indexPath.row];
	
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Item Selecionado" 
													message:msg 
												   delegate:self 
										  cancelButtonTitle:@"OK" 
										  otherButtonTitles:nil];
	
	
	
	[alert show]; 
	[alert release]; 
	[msg release];
	
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
    [super dealloc];
}


@end

