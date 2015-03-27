//
//  ViewController.h
//  testCoreData
//
//  Created by broy denty on 14-1-23.
//  Copyright (c) 2014年 denty. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *inputText;
@property (strong,nonatomic)NSManagedObjectContext *context;
@end
