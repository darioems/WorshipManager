//
//  Integrantes.m
//  WorshipManager
//
//  Created by Dário on 11/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Integrantes.h"

#import "Conexao.h"


@implementation Integrantes

@synthesize idIntegrante, idCargo;
@synthesize nomeIntegrante, apelidoIntegrante, aniversarioIntegrante, enderecoIntegrante, bairroIntegrante, 
			cidadeIntegrante, estadoIntegrante;

// Busca todos os Integrantes
+(NSMutableArray* )getAllIntegrantes {
	
	Conexao *c = [[Conexao alloc] init];
	sqlite3 *database = [c getDatabase];
	[c release];
	
	NSMutableArray *allIntegrantes = [[NSMutableArray alloc] init];
	
	if (database != nil) {
		const char *sqlStatement ="SELECT * FROM integrantes order by nomeIntegrante ASC";
		sqlite3_stmt *compiledStatement;
		
		if (sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK) {
			Integrantes *integranteAux = nil;
			while (sqlite3_step(compiledStatement) == SQLITE_ROW) {
				int *idIntegranteAux = (int *) sqlite3_column_int(compiledStatement, 0);
				int *idCargoAux = (int *) sqlite3_column_int(compiledStatement, 1);
				NSString *nomeIntegranteAux = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 2)];	
				NSString *apelidoIntegranteAux = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 3)];	
				NSString *aniversarioIntegranteAux = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 3)];	
				NSString *enderecoIntegranteAux = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 5)];	
				NSString *bairroIntegranteAux = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 6)];	
				NSString *cidadeIntegranteAux = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 7)];	
				NSString *estadoIntegranteAux = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 8)];	
				
				integranteAux = [[Integrantes alloc] init];
				[integranteAux setIdIntegrante:idIntegranteAux];
				[integranteAux setIdCargo:idCargoAux];
				[integranteAux setNomeIntegrante:nomeIntegranteAux];
				[integranteAux setApelidoIntegrante:apelidoIntegranteAux];
				[integranteAux setAniversarioIntegrante:aniversarioIntegranteAux];
				[integranteAux setEnderecoIntegrante:enderecoIntegranteAux];
				[integranteAux setBairroIntegrante:bairroIntegranteAux];
				[integranteAux setCidadeIntegrante:cidadeIntegranteAux];
				[integranteAux setEstadoIntegrante:estadoIntegranteAux];
				
				
				[allIntegrantes addObject:integranteAux];
				
			}
			
		}
		sqlite3_finalize(compiledStatement);
		sqlite3_close(database);
		
	}
	
	
	return allIntegrantes;
	
}

// Busca o Integrante pelo idIntegrante

+(Integrantes *)getIntegrantesWithidIntegrante:(int*)idIntegranteAux {
	
	Conexao *c = [[Conexao alloc] init];
	sqlite3 *database = [c getDatabase];
	[c release];
	
	Integrantes *singleIntegrante = nil;
	
	if (database != nil) {
		
		const char *sqlStatement = "SELECT * FROM integrante WHERE idIntegrante = ?";
		
		sqlite3_stmt *compiledStatement;
		
		if (sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK) {
			
			sqlite3_bind_int(compiledStatement, 1, (int)idIntegranteAux);
			
			while (sqlite3_step(compiledStatement) == SQLITE_ROW) {
			
				
				int *idIntegranteAux = (int *) sqlite3_column_int(compiledStatement, 0);
				int *idCargoAux = (int *) sqlite3_column_int(compiledStatement, 1);
				NSString *nomeIntegranteAux = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 2)];	
				NSString *apelidoIntegranteAux = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 3)];	
				NSString *aniversarioIntegranteAux = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 4)];	
				NSString *enderecoIntegranteAux = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 5)];	
				NSString *bairroIntegranteAux = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 6)];	
				NSString *cidadeIntegranteAux = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 7)];	
				NSString *estadoIntegranteAux = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 8)];	
				
				singleIntegrante = [[Integrantes alloc] init];
				[singleIntegrante setIdIntegrante:idIntegranteAux];
				[singleIntegrante setIdCargo:idCargoAux];
				[singleIntegrante setNomeIntegrante:nomeIntegranteAux];
				[singleIntegrante setApelidoIntegrante:apelidoIntegranteAux];
				[singleIntegrante setAniversarioIntegrante:aniversarioIntegranteAux];
				[singleIntegrante setEnderecoIntegrante:enderecoIntegranteAux];
				[singleIntegrante setBairroIntegrante:bairroIntegranteAux];
				[singleIntegrante setCidadeIntegrante:cidadeIntegranteAux];
				[singleIntegrante setEstadoIntegrante:estadoIntegranteAux];
			}
		}
		
		sqlite3_finalize(compiledStatement);
		sqlite3_close(database);
	}
	return singleIntegrante;
	
}


@end
