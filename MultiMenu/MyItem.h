//
//  MyItem.h
//  MultiMenu
//
//  Created by gaogao on 1/28/13.
//  Copyright (c) 2013 lxm. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyItem : NSObject
@property (nonatomic,retain)  NSString * title;
@property (nonatomic) NSInteger level;
@property (nonatomic, retain) NSMutableArray *subItems;
@property (nonatomic) BOOL isSubItemOpen;
@property (nonatomic) BOOL isSubCascadeOpen;
@end
