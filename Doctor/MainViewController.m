//
//  MainViewController.m
//  doctor
//
//  Created by Ever on 15/3/17.
//  Copyright (c) 2015年 Ever. All rights reserved.
//

#import "MainViewController.h"
#import "ViewMacro.h"

@interface MainViewController ()

@end

@implementation MainViewController

#pragma mark - view lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:color(232, 232, 232, 1)];
    self.navigationItem.title=@"";
    
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

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *title=nil;
    switch (section) {
        case kSectionHead:
            title=@"头部";
            break;
        case kSectionBody:
            title=@"躯干";
            break;
        case kSectionAccident:
            title=@"意外";
            break;
        case kSectionNature:
            title=@"自然";
            break;
        case kSectionNormal:
            title=@"常识";
            break;
        default:
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
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:identity];
    if (cell==nil) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identity];
    }
    return cell;
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
