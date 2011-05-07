//
//  WorshipManagerAppDelegate.h
//  WorshipManager
//
//  Created by Dário on 11/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WorshipManagerAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	
}

-(void)copyDatabaseIfNeeded;

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

