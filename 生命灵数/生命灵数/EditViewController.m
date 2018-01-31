//
//  EditViewController.m
//  生命灵数
//
//  Created by tzsoft on 2018/1/30.
//  Copyright © 2018年 胡小羊. All rights reserved.
//

#import "EditViewController.h"
#import "DetailViewController.h"

@interface EditViewController ()
@property (nonatomic ,strong) NSArray *dataArr;
@end

@implementation EditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.tableFooterView = [UIView new];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"listCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
       cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }

    NSDictionary *dataDict = self.dataArr[indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"生命灵数：%@",dataDict[@"title"]];
    cell.detailTextLabel.text = dataDict[@"content"];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    id vc = segue.destinationViewController;
    if ([vc isKindOfClass:[DetailViewController class]]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        DetailViewController *dvc = segue.destinationViewController;
        dvc.dataDict =self.dataArr[indexPath.row];
    }
   
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}
#pragma mark - 获取沙河目录
- (NSString *)getPath{
    NSString *home = NSHomeDirectory();
    //2、获取document路径
    NSString *docPath = [home stringByAppendingPathComponent:@"Documents"];
    NSLog(@"%@",docPath);
    
    NSString *filePath = [docPath stringByAppendingPathComponent:@"data.plist"];
    return filePath;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.dataArr = [NSArray arrayWithContentsOfFile:[self getPath]];
    [self.tableView reloadData];
}
@end
