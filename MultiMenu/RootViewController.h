//
//  RootViewController.h
//  MultiMenu
//
//  Created by gaogao on 1/28/13.
//  Copyright (c) 2013 lxm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuData.h"
#import "MenuItemCell.h"


@interface RootViewController : UITableViewController


@property (nonatomic,retain) MenuData * menuData;

@end
