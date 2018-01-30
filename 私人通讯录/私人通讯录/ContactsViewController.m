//
//  ContactsViewController.m
//  私人通讯录
//
//  Created by tzsoft on 2018/1/26.
//  Copyright © 2018年 胡小羊. All rights reserved.
//

#import "ContactsViewController.h"
#import "AddViewController.h"
#import "EditViewController.h"
#import "ContactsModel.h"

@interface ContactsViewController ()<UIActionSheetDelegate,UITableViewDelegate,UITableViewDataSource>
- (IBAction)logout:(UIBarButtonItem *)sender;

@property (nonatomic ,strong)NSMutableArray *dataArr;
@end

@implementation ContactsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID= @"contacts";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
//    }
    ContactsModel *model =_dataArr[indexPath.row];
    cell.textLabel.text = model.name;
    cell.detailTextLabel.text = model.phone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (NSMutableArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    id vc = segue.destinationViewController;
    if ([vc isKindOfClass:[AddViewController class]]) {
        AddViewController *avc = segue.destinationViewController;
        
        avc.addBlock = ^(ContactsModel *model){
            [self.dataArr addObject:model];
            [self.tableView reloadData];
            NSLog(@"姓名：%@ -- 电话：%@",model.name, model.phone);
        };
    }else{
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        EditViewController *evc = vc;
        evc.model = self.dataArr[indexPath.row];
        evc.saveEvent = ^(ContactsModel *editModel) {
            
            [self.tableView reloadData];
        };
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _dataArr.count;
}


- (IBAction)logout:(UIBarButtonItem *)sender {
    UIActionSheet *sheet = [[UIActionSheet alloc]initWithTitle:@"确定要注销？" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [sheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0) {
        [self.navigationController popViewControllerAnimated:NO];
    }
}
@end
