//
//  HomeCell.h
//  HLYRepository
//
//  Created by tzsoft on 2018/5/10.
//  Copyright © 2018年 HLY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *contentLab;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *cellWidth;


@property (nonatomic ,strong)NSString *coontentStr;
@end
