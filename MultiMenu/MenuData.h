//
//  MenuData.h
//  MultiMenu
//
//  Created by gaogao on 1/30/13.
//  Copyright (c) 2013 lxm. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyItem.h"


@interface MenuData : NSObject
{

    //NSMutableArray * array;
    //NSMutableArray *modelData;
    MyItem * rootItem;
    
    NSMutableArray * treeItemsToRemove;
    NSMutableArray * treeItemsToInsert;
    
}

//+ (MenuData *) sharedMenuData;

@property (nonatomic,retain,readonly) NSMutableArray *tableViewData;

- (NSArray *)insertMenuIndexPaths:(MyItem *)item;
- (NSArray *)deleteMenuIndexPaths:(MyItem *)item;

@end
