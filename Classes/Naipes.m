//
//  Naipes.m
//  WorshipManager
//
//  Created by Dário on 11/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Naipes.h"

#import "Conexao.h"

#import "Integrantes.h"


@implementation Naipes

@synthesize idNaipe;
@synthesize naipe, obs;

// Busca todos os Naipes
+(NSMutableArray *)getAllNaipes {
	
	Conexao *c = [[Conexao alloc] init];
	sqlite3 *database = [c getDatabase];
	[c release];
	
	NSMutableArray *allNaipes = [[NSMutableArray alloc] init];
	
	if (database != nil) {
		
		const char *sqlStatement ="SELECT * FROM naipes order by naipe ASC";
		
		sqlite3_stmt *compiledStatement;
		
	
		if (sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK) {			
			
			
			
			Naipes *naipe = nil;
			while (sqlite3_step(compiledStatement) == SQLITE_ROW) {
				int *idNaipeAux = (int *) sqlite3_column_int(compiledStatement, 0);
				NSString *naipeAux = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 1)];	
				NSString *obsAux = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 2)];	
				
				naipe = [[Naipes alloc] init];
				[naipe setIdNaipe:idNaipeAux];
				[naipe setNaipe:naipeAux];
				[naipe setObs:obsAux];
				
				[allNaipes addObject:naipe];
				
			}
			
		}
		sqlite3_finalize(compiledStatement);
		sqlite3_close(database);
		
	}
	
	
	return allNaipes;
	
}

// Busca o Naipe pelo seu id
+(Naipes *)getNaipesWithidNaipe:(int*)idNaipeAux {
	
	Conexao *c = [[Conexao alloc] init];
	sqlite3 *database = [c getDatabase];
	[c release];
	
	Naipes *singleNaipe = nil;
	
	if (database != nil) {
		//const char *sqlStatement ="SELECT integrantes.nomeIntegrante, naipes.naipe 
		//FROM integrantes, naipes, integranteNaipe 
		//WHERE integranteNaipe.idNaipe = naipes.idNaipe 
		//AND integranteNaipe.idIntegrante = integrantes.idIntegrante 
		//AND naipes.idNaipe = ?";
		
		const char *sqlStatement = "SELECT * FROM naipes WHERE idNaipe = ?";
		
		sqlite3_stmt *compiledStatement;
		
		if (sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK) {
			
			sqlite3_bind_int(compiledStatement, 1, (int)idNaipeAux);
			
			while (sqlite3_step(compiledStatement) == SQLITE_ROW) {
				
				int *idNaipeAux = (int *) sqlite3_column_int(compiledStatement, 0);
				NSString *naipeAux = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 1)];
				NSString *obsAux = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 2)];
				
				singleNaipe = [[Naipes alloc] init];
				[singleNaipe setIdNaipe:idNaipeAux];
				[singleNaipe setNaipe:naipeAux];
				[singleNaipe setObs:obsAux];
			}
		}
		
		sqlite3_finalize(compiledStatement);
		sqlite3_close(database);
	}
	return singleNaipe;
}

@end