//
//  AppDelegate.h
//  testCoreData
//
//  Created by broy denty on 14-1-23.
//  Copyright (c) 2014年 denty. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (readonly,strong,nonatomic)NSManagedObjectContext *managedObjectContext;
@property (readonly,strong,nonatomic)NSManagedObjectModel *managedObjectModel;
@property (readonly,strong,nonatomic)NSPersistentStoreCoordinator *persistentStoreCoordinator;
- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;
@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ViewController *viewController;

@end
				