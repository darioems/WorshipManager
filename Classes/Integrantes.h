//
//  Integrantes.h
//  WorshipManager
//
//  Created by Dário on 11/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Integrantes : NSObject {
	
	int *idIntegrante, *idCargo;
	NSString *nomeIntegrante, *apelidoIntegrante, 
	*aniversarioIntegrante, *enderecoIntegrante, 
	*bairroIntegrante, *cidadeIntegrante, *estadoIntegrante;

}

@property (nonatomic, assign) int *idIntegrante, *idCargo;
@property (nonatomic, retain) NSString *nomeIntegrante, *apelidoIntegrante, *aniversarioIntegrante, 
							*enderecoIntegrante, *bairroIntegrante, *cidadeIntegrante, *estadoIntegrante;

// Busca todos os Integrantes
+(NSMutableArray*)getAllIntegrantes;

// Busca o Integrante pelo idIntegrante

+(Integrantes *)getIntegrantesWithidIntegrante:(int*)idIntegranteAux;

@end
