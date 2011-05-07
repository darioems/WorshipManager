//
//  NaipesViewController.h
//  WorshipManager
//
//  Created by Dário on 11/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Naipes;


@interface NaipesViewController : UIViewController {

	Naipes *naipe;
	
	IBOutlet UILabel *idNaipeLabel, *naipeLabel, *obsLabel, *testeLabel;
}

-(id)initWithIdNaipe:(int*)idNaipe;

@property (nonatomic, retain) UILabel *idNaipeLabel, *naipeLabel, *obsLabel, *testeLabel;

@end
