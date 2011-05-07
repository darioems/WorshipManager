//
//  WorshipManagerAppDelegate.m
//  WorshipManager
//
//  Created by Dário on 11/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "WorshipManagerAppDelegate.h"

#import "NaipesTableViewController.h"

#import "IntegrantesTableViewController.h"

@implementation WorshipManagerAppDelegate

@synthesize window;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
	
	sleep(1);
    
	[self copyDatabaseIfNeeded];
	
	NSMutableArray *localControllers = [[NSMutableArray alloc] initWithCapacity:3];
	
	UINavigationController *navigationController = [[UINavigationController alloc] init];
	
	
	
	//Tab Integrantes
	
	IntegrantesTableViewController *integrantes = [[IntegrantesTableViewController alloc] initWithNibName:@"IntegrantesTableViewController" bundle:nil];	
	
	integrantes.tabBarItem.title = @"Integrantes";
	
	integrantes.tabBarItem.image = [UIImage imageNamed:@"integrantes.png"];
	
	[localControllers addObject:navigationController];
	
	[navigationController pushViewController:integrantes animated:YES];
	
	
	
	// Tab Naipes
	
	NaipesTableViewController *naipes = [[NaipesTableViewController alloc] initWithNibName:@"NaipesTableViewController" bundle:nil];
	
	naipes.tabBarItem.title = @"Naipes";
	
	naipes.tabBarItem.image = [UIImage imageNamed:@"naipes.png"];
	
	
	
	[localControllers addObject:naipes];
	

	
	UITabBarController *tabBarController = [[UITabBarController alloc] init];
	tabBarController.viewControllers = localControllers;

	[localControllers release];	
		
    // Add the view controller's view to the window and display.
    
	[self.window addSubview:tabBarController.view];
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

-(void)copyDatabaseIfNeeded {
	
	NSFileManager *fileManager = [NSFileManager defaultManager];
	
	NSError *error;	
	
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	
	NSString *documentsDir = [paths objectAtIndex:0];
	
	NSString *dbPath = [documentsDir stringByAppendingPathComponent:@"WorshipManagerNew.sqlite"];
	
	
	
	BOOL success = [fileManager fileExistsAtPath:dbPath];
	
	
	
	if (!success) {
		
		NSString *defaultDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"WorshipManagerNew.sqlite"];
		
		success = [fileManager copyItemAtPath:defaultDBPath toPath:dbPath error:&error];
		
		
		
		if (!success) {
			
			NSAssert1(0, @"Failed to create writable database file with message '%@'.", [error localizedDescription]);
			
		}
		
	}
	
}



- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
	
    [window release];
    [super dealloc];
}


@end
