//
//  MenuData.m
//  MultiMenu
//
//  Created by gaogao on 1/30/13.
//  Copyright (c) 2013 lxm. All rights reserved.
//

#import "MenuData.h"


@interface MenuData ()
  @property (nonatomic,retain,readwrite) NSMutableArray *tableViewData;

@end


//static MenuData * sharedMenuData =nil;

@implementation MenuData
@synthesize  tableViewData = _tableViewData;



- (id) init
{
    self = [super init];
    if (self) {
        self.tableViewData = [NSMutableArray array];
        
        treeItemsToRemove = [NSMutableArray array];
        [treeItemsToRemove retain];
        treeItemsToInsert = [NSMutableArray array];
        [treeItemsToInsert retain];
        
        [self initModelData];
        
    }
    return  self;

}

- (void)dealloc
{

    [treeItemsToRemove release];
    [rootItem release];
    [_tableViewData release];
    [super dealloc];
}


- (void) initModelData
{
    
    rootItem = [[MyItem alloc] init];
    
    rootItem.title = @"根菜单";
    rootItem.subItems = [NSMutableArray array];
    rootItem.level = 0;
    
    NSArray * firstMenuData;
    NSArray * thirdMenuData0;
    firstMenuData = [NSArray arrayWithObjects:@"菜单一",@"菜单二",@"菜单三", @"菜单四", @"菜单五",  nil];
    NSArray * secondMenuData0,* secondMenuData1;
    
    secondMenuData0 = [NSArray arrayWithObjects:@"子项一",@"子项二", @"子项三",nil];
    
    secondMenuData1 = [NSArray arrayWithObjects:@"选择一",@"选择二",nil];
    
    thirdMenuData0 = [NSArray arrayWithObjects:@"内容1",@"内容2", nil];
    
    
    //init first Menu
    for (int i = 0; i < [firstMenuData count]; i++)
    {
        NSString * title =[firstMenuData objectAtIndex:i];
        MyItem *firstItem;
        firstItem = [[[MyItem alloc]init]autorelease ];
        firstItem.title = title;
        firstItem.subItems = [NSMutableArray array];
        //parent item??
        firstItem.level =1;
        if ([title isEqualToString: @"菜单一"]) {
            for (int i = 0; i < [secondMenuData1 count]; i++) {
                NSString * title =[secondMenuData1 objectAtIndex:i];
                MyItem *secondeItem;
                secondeItem = [[[MyItem alloc]init]autorelease ];
                secondeItem.title = title;
                secondeItem.subItems = [NSMutableArray array];
                //parent item??
                secondeItem.level =2;
                [firstItem.subItems addObject:secondeItem];
            }
        }
        
        if ([title isEqualToString: @"菜单四"]) {
            for (int i = 0; i < [secondMenuData0 count]; i++) {
                NSString * title =[secondMenuData0 objectAtIndex:i];
                MyItem *secondeItem;
                secondeItem = [[[MyItem alloc]init]autorelease ];
                secondeItem.title = title;
                secondeItem.subItems = [NSMutableArray array];
                //parent item??
                secondeItem.level =2;
                secondeItem.isSubCascadeOpen = YES;
                if ([title isEqualToString:@"子项三"]) {
                    for (int i = 0; i< [thirdMenuData0 count]; i++) {
                        NSString *title = [thirdMenuData0 objectAtIndex:i];
                        MyItem *thirdItem;
                        thirdItem  = [[[MyItem alloc]init] autorelease];
                        thirdItem.title = title;
                        thirdItem.subItems = [NSMutableArray array];
                        thirdItem.level = 3;
                        [secondeItem.subItems addObject:thirdItem];
                    }
                }
                [firstItem.subItems addObject:secondeItem];
               
            }
            
        }
        [rootItem.subItems addObject:firstItem];
    }
    
    [_tableViewData addObject:rootItem];
}



#pragma mark -- insert
- (NSArray *)insertMenuIndexPaths:(MyItem *)item
{
    NSArray * arr;
    [treeItemsToInsert removeAllObjects];
    [self insertMenuObject:item];
    arr = [self insertIndexsOfMenuObject:treeItemsToInsert];
    return arr;
}
- (void) insertMenuObject:(MyItem *)item
{
    NSLog(@"%d",[_tableViewData indexOfObject:item]);
    if (item == nil)
    {
        return ;
    }
    
    NSIndexPath *path = [NSIndexPath indexPathForRow:[_tableViewData indexOfObject:item] inSection:0];
    
    MyItem *childItem;
    for (int i = 0; i<[item.subItems count] ; i++) {
        childItem = [item.subItems objectAtIndex:i];
        [_tableViewData insertObject:childItem atIndex:path.row + i +1];
        [treeItemsToInsert addObject:childItem];
        item.isSubItemOpen = YES;
    }
    
    for (int i = 0; i <[item.subItems count]; i ++) {
        childItem = [item.subItems objectAtIndex:i];
        
        if (childItem .isSubCascadeOpen) {
            [self insertMenuObject:childItem];
        }
        
    }
    return ;
    
}
- (NSArray *) insertIndexsOfMenuObject :(NSMutableArray *) array
{
    
    NSMutableArray * mutableArr;
    mutableArr = [NSMutableArray array];
    for (MyItem * item in array) {
        NSIndexPath *path = [NSIndexPath indexPathForRow:[_tableViewData indexOfObject:item] inSection:0];
        [mutableArr addObject:path];
    }
    return mutableArr;
}
#pragma mark -- delete
- (NSArray *)deleteMenuIndexPaths:(MyItem *)item
{
    NSArray * arr;
    [treeItemsToRemove removeAllObjects];
    [self deleteMenuObject:item];
    arr = [self deleteIndexsOfMenuObject:treeItemsToRemove];
    return arr;
}
- (void) deleteMenuObject:(MyItem *)item
{
    NSLog(@"%d",[_tableViewData indexOfObject:item]);
    if (item == nil)
    {
        return ;
    }
    
    MyItem *childItem;
    for (int i = 0; i<[item.subItems count] && item.isSubItemOpen ; i++) {
        childItem = [item.subItems objectAtIndex:i];
        [self deleteMenuObject:childItem];
        
        [treeItemsToRemove addObject:childItem];
        // [tableViewData removeObject:childItem];
        
    }
    
    item.isSubItemOpen = NO;
    
    return ;
}
- (NSArray *) deleteIndexsOfMenuObject:(NSMutableArray *)arr
{
    
    NSMutableArray *mutableArr;
    mutableArr = [NSMutableArray array];
    NSMutableIndexSet * set;
    set = [NSMutableIndexSet indexSet];
    for (int i = 0; i < [treeItemsToRemove count]; i++)
    {
        MyItem * item;
        item = [treeItemsToRemove objectAtIndex:i];
        NSIndexPath *path = [NSIndexPath indexPathForRow:[_tableViewData indexOfObject:item] inSection:0];
        [mutableArr addObject:path];
        [set addIndex:path.row];
    }
    
    [_tableViewData removeObjectsAtIndexes:set];
    
    return mutableArr;
}






@end
