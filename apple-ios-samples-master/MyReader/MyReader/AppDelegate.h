//
//  AppDelegate.h
//  MyReader
//
//  Created by broy denty on 14-6-6.
//  Copyright (c) 2014年 denty. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MRNavigationViewController.h"
#import "RootViewController.h"
#import "UIView+Additions.h"
#import "UIImageView+WebCache.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@property (nonatomic, strong) MRNavigationViewController *navigationVC;
@property (nonatomic, strong) RootViewController *rootVC;
- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
