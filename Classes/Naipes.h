//
//  Naipes.h
//  WorshipManager
//
//  Created by Dário on 11/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Naipes : NSObject {
	
	int *idNaipe;
	NSString *naipe;
	NSString *obs;

}

@property (nonatomic, assign) int *idNaipe;
@property (nonatomic, retain) NSString *naipe, *obs;

// Busca todos os Naipes
+(NSMutableArray*)getAllNaipes;

// Busca o Naipe pelo seu id
+(Naipes *)getNaipesWithidNaipe:(int*)idNaipeAux;

@end
