//
//  MenuItemCell.h
//  MultiMenu
//
//  Created by gaogao on 1/30/13.
//  Copyright (c) 2013 lxm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyItem.h"

@interface MenuItemCell : UITableViewCell

{

    UILabel * label;
    UILabel * detailLabel;
    
    


    
}

@property(nonatomic,retain) MyItem *  item;
@property(nonatomic)BOOL isOpen;

-(void) setLevel:(NSUInteger) level;
@end
