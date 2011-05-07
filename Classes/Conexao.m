//
//  Conexao.m
//  WorshipManager
//
//  Created by Dário on 11/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Conexao.h"


@implementation Conexao

-(sqlite3 *) getDatabase {

	/*sqlite3 *database;
	
	
	NSString *dbPath = [[NSBundle mainBundle] pathForResource:@"WorshipManagerNew" ofType:@"sqlite"];
	
	
	if (sqlite3_open([dbPath UTF8String], &database) == SQLITE_OK) {

		return database;
	}
	
	return nil;*/
	
	
	sqlite3 *database;
	
	
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	
	
	NSString *documentsDir = [paths objectAtIndex:0];
	
	
	NSString *dbPath = [documentsDir stringByAppendingPathComponent:@"WorshipManagerNew.sqlite"];
	
	
	
	if (SQLITE_OK == sqlite3_open([dbPath UTF8String], &database)) {
		
		
		return database;
		
		
	}
	
	
	return nil;
	
}

@end
