//
//  IntegranteNaipe.m
//  WorshipManager
//
//  Created by Dário on 11/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "IntegranteNaipe.h"

#import "Conexao.h"

#import "Naipes.h"

#import "Integrantes.h"


@implementation IntegranteNaipe


// Busca os integrantes com idNaipe = xxxx
+(NSMutableArray *)getAllIntegrantesWithIdNaipe:(int*)idNaipeAux {
	
	Conexao *c = [[Conexao alloc] init];
	sqlite3 *database = [c getDatabase];
	[c release];
	
	NSMutableArray *allIntegrantesNaipe = [[NSMutableArray alloc] init];
	
	if (database != nil) {
		const char *sqlStatement ="SELECT integrantes.* FROM integrantes, naipes, integranteNaipe WHERE integranteNaipe.idNaipe = naipes.idNaipe AND integranteNaipe.idIntegrante = integrantes.idIntegrante AND naipes.idNaipe = ?";
		
		sqlite3_stmt *compiledStatement;
		
		if (sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK) {
			
			Integrantes *integranteAux = nil;
			
			sqlite3_bind_int(compiledStatement, 1, (int)idNaipeAux);
			
			while (sqlite3_step(compiledStatement) == SQLITE_ROW) {
				
				int *idIntegranteAux = (int *) sqlite3_column_int(compiledStatement, 1);
				int *idCargoAux = (int *) sqlite3_column_int(compiledStatement, 1);
				NSString *nomeIntegranteAux = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 3)];	
				NSString *apelidoIntegranteAux = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 3)];	
				NSString *aniversarioIntegranteAux = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 3)];	
				NSString *enderecoIntegranteAux = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 3)];	
				NSString *bairroIntegranteAux = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 3)];	
				NSString *cidadeIntegranteAux = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 3)];	
				NSString *estadoIntegranteAux = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 3)];	
				
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
				
				
				[allIntegrantesNaipe addObject:integranteAux];
				
			}
			
		}
		sqlite3_finalize(compiledStatement);
		sqlite3_close(database);
		
	}
	
	
	return allIntegrantesNaipe;
}




@end
