//
//  MenuItemCell.m
//  MultiMenu
//
//  Created by gaogao on 1/30/13.
//  Copyright (c) 2013 lxm. All rights reserved.
//

#import "MenuItemCell.h"

@implementation MenuItemCell
@synthesize item = _item;
@synthesize  isOpen = _isOpen;


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        label = [[UILabel alloc] initWithFrame:CGRectMake(20, 10, 100, 30)];
        detailLabel = [[UILabel alloc] initWithFrame:CGRectMake(200, 10, 50, 30)];
        
        [self addSubview:label];
        [self addSubview: detailLabel];
        
        
    }
    return self;
}


- (void)dealloc
{
    [label release];
    [detailLabel release];
    [super dealloc];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setLevel:(NSUInteger)level
{
    
    if (self.item) {
        
        label.text = _item.title;
        
        if ([_item.subItems count]>0) {
            detailLabel.text = [NSString stringWithFormat:@"%d", [_item.subItems count ] ];
        }
        else
        {
            detailLabel.text = @"-";
        }
        
    }

    CGRect rect;
    rect = label.frame ;
    rect.origin.x = level *20 ;
    label.frame = rect;
    
}

@end
