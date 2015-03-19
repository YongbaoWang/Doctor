//
//  MainViewController.m
//  doctor
//
//  Created by Ever on 15/3/17.
//  Copyright (c) 2015年 Ever. All rights reserved.
//

#import "MainViewController.h"
#import "ViewMacro.h"
#import "MainTableViewCell.h"

@interface MainViewController ()

@end

@implementation MainViewController

#pragma mark - view lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg"]]];
    self.navigationItem.title=@"";
    [self.tableView setBackgroundColor:[UIColor clearColor]];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UILabel *title=[[UILabel alloc] init];
    [title setBackgroundColor:color(0, 0, 0, 0.2)];

    switch (section) {
        case kSectionHead:
            title.text=@"头部";
            break;
        case kSectionBody:
            title.text=@"躯干";
            break;
        case kSectionAccident:
            title.text=@"意外";
            break;
        case kSectionNature:
            title.text=@"自然";
            break;
        case kSectionNormal:
            title.text=@"常识";
            break;
        default:
            title.text=@"";
            break;
    }
    return title;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger rowNum=0;
    switch (section) {
        case kSectionHead:
            rowNum=8;
            break;
        case kSectionBody:
            rowNum=9;
            break;
        case kSectionAccident:
            rowNum=4;
            break;
        case kSectionNature:
            rowNum=5;
            break;
        case kSectionNormal:
            rowNum=8;
            break;
        default:
            break;
    }
    return rowNum;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identity=@"myCell";
    MainTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:identity];
    if (cell==nil) {
        cell=[[MainTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identity];
    }
    cell.index=indexPath.row%4+1;
    cell.title=@"Abc";
    return cell;
}

#pragma mark - UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
