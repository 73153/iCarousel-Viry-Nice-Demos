//
//  ArInfo.h
//  testCoreData
//
//  Created by broy denty on 14-1-24.
//  Copyright (c) 2014年 denty. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface ArInfo : NSManagedObject

@property (nonatomic, retain) NSString* myid;
@property (nonatomic, retain) NSString* myname;

@end
