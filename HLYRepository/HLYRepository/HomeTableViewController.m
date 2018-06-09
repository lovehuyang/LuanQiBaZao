//
//  HomeTableViewController.m
//  HLYRepository
//
//  Created by tzsoft on 2018/5/3.
//  Copyright © 2018年 HLY. All rights reserved.
//

#import "HomeTableViewController.h"
#import "AutoLayoutController.h"
#import "MasonryController.h"
#import "TransformViewController.h"
#import "HomeCell.h"

@interface HomeTableViewController ()
{
    NSArray *dataArr;
}
@end

@implementation HomeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"HLYRepository";
    dataArr = [NSArray arrayWithObjects:@"AutoLayout",@"Masonry", @"Transform",@"Page",nil];
    
    self.tableView.estimatedRowHeight = 500;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
//    cell.textLabel.text = dataArr[indexPath.row];
    
    HomeCell *cell = [[[NSBundle mainBundle]loadNibNamed:@"HomeCell" owner:self options:nil]lastObject];
    cell.coontentStr = dataArr[indexPath.row];
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:
        {
            AutoLayoutController *avc = [[[NSBundle mainBundle]loadNibNamed:@"AutoLayoutController" owner:nil options:nil] lastObject];
            [self.navigationController pushViewController:avc animated:YES];
        }
            
            break;
        case 1:
        {
            MasonryController *mvc = [MasonryController new];
            [self presentViewController:mvc animated:YES completion:nil];
        }
            
            break;
            
        case 2:
        {
            TransformViewController *mvc = [TransformViewController new];
            [self.navigationController pushViewController:mvc animated:YES];
        }
            
            break;
            
        default:
        {
            Class class = NSClassFromString([NSString stringWithFormat:@"%@ViewController",dataArr[indexPath.row]]);
            UIViewController *vc = [class new];
            [self.navigationController pushViewController:vc animated:YES];
            
        }
            break;
    }
}

@end
