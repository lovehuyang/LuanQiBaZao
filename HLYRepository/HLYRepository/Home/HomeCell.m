//
//  HomeCell.m
//  HLYRepository
//
//  Created by tzsoft on 2018/5/10.
//  Copyright © 2018年 HLY. All rights reserved.
//

#import "HomeCell.h"

@implementation HomeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.cellWidth.constant = [UIScreen mainScreen].bounds.size.width - 40;
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
}

- (void)setCoontentStr:(NSString *)coontentStr{
    self.contentLab.text = coontentStr;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
