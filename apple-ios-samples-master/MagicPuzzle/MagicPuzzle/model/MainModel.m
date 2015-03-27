//
//  MainModel.m
//  MagicPuzzle
//
//  Created by broy denty on 14-4-25.
//  Copyright (c) 2014年 denty. All rights reserved.
//

#import "MainModel.h"

@implementation MainModel
static MainModel * shareInstance;

+ (MainModel *)shareInstance
{
    if (shareInstance == nil) {
        @synchronized(self)
        {
            shareInstance = [[MainModel alloc] init];
            return shareInstance;
        }
    }
    return shareInstance;
}

+ (id)allocWithZone:(NSZone *)zone {
	@synchronized(self) {
		if (shareInstance == nil) {
			shareInstance = [super allocWithZone:zone];
			return shareInstance;  // assignment and return on first allocation
		}
	}
	return nil; //on subsequent allocation attempts return nil
}
@end
