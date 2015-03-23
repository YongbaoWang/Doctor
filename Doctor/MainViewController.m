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
#import "DetailViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

#pragma mark - view lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *imageView=[[UIImageView alloc] initWithFrame:self.view.frame];
    imageView.image=[UIImage imageNamed:@"bg"];
    [imageView setContentMode:UIViewContentModeScaleToFill];
    [self.view insertSubview:imageView atIndex:0];
    UILabel *title=[[UILabel alloc] initWithFrame:CGRectMake(0, 0,80, 44)];
    title.text=@"急救医生";
    [title setTextColor:[UIColor redColor]];
    [title setFont:[UIFont systemFontOfSize:18.0]];
    self.navigationItem.titleView=title;
    [self.tableView setBackgroundColor:[UIColor clearColor]];
    
    self.seg.frame=CGRectMake(100, 100, 90, 90);

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
    [self refreshCell:cell forRowAtIndexPath:indexPath];
    
    
    return cell;
}

-(void)refreshCell:(MainTableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.index=indexPath.row%4+1;
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    NSString *title=nil;
    switch (indexPath.section) {
        case kSectionHead:
            switch (indexPath.row) {
                case kTouBuWaiShang:
                    title=@"头部外伤急救";
                    break;
                case kSuanJianShangYan:
                    title=@"酸碱伤眼急救";
                    break;
                case kMeiQiZhongDu:
                    title=@"煤气中毒急救";
                    break;
                case kYiWuXiRu:
                    title=@"异物吸入急救";
                    break;
                case kNiShui:
                    title=@"溺水急救";
                    break;
                case kNongYaoZhongDu:
                    title=@"农药中毒急救";
                    break;
                case kShiWuZhongDu:
                    title=@"食物中毒急救";
                    break;
                case kKeXue:
                    title=@"咳血急救";
                    break;
                default:
                    title=nil;
                    break;
            };
            break;
        case kSectionBody:
            switch (indexPath.row) {
                case kDongMaiChuXie:
                    title=@"动脉出血急救";
                    break;
                case kTuoJiu:
                    title=@"脱臼急救";
                    break;
                case kGuZhe:
                    title=@"骨折急救";
                    break;
                case kJiXingYaoNiuShang:
                    title=@"急性腰扭伤急救";
                    break;
                case kJiZhuangGuSunShang:
                    title=@"脊柱骨损伤急救";
                    break;
                case kXinZangBing:
                    title=@"心脏病发作急救";
                    break;
                case kXiongBuWaiShang:
                    title=@"胸部外伤急救";
                    break;
                case kXingJiaoCuSi:
                    title=@"性交猝死急救";
                    break;
                case kZuHuaiNiuShang:
                    title=@"足踝扭伤急救";
                    break;
                default:
                    title=nil;
                    break;
            };
            break;
        case kSectionAccident:
            switch (indexPath.row) {
                case kChuDian:
                    title=@"触电急救";
                    break;
                case kZhuoShang:
                    title=@"灼伤急救";
                    break;
                case kSheYaoShang:
                    title=@"蛇咬伤急救";
                    break;
                case kYunJue:
                    title=@"晕厥急救";
                    break;
                default:
                    title=nil;
                    break;
            };
            break;
        case kSectionNature:
            switch (indexPath.row) {
                case kDiZhen:
                    title=@"地震自救";
                    break;
                case kHaiXiao:
                    title=@"海啸自救";
                    break;
                case kNiShiLiu:
                    title=@"泥石流自救";
                    break;
                case kHuaPo:
                    title=@"滑坡自救";
                    break;
                case kHongShui:
                    title=@"洪水自救";
                    break;
                default:
                    title=nil;
                    break;
            };
            break;
        case kSectionNormal:
            switch (indexPath.row) {
                case kJiJiuYuanZe:
                    title=@"急救原则";
                    break;
                case kJiaTingXiaoYaoXiang:
                    title=@"家庭小药箱";
                    break;
                case kXiaoZhiShi:
                    title=@"小知识熟记";
                    break;
                case kJinJiHujiu:
                    title=@"紧急呼救常识";
                    break;
                case kRenGongHuXi:
                    title=@"人工呼吸法";
                    break;
                case kTuShouXinFeiFuSu:
                    title=@"心肺复苏术";
                    break;
                case kCuSi:
                    title=@"什么叫猝死";
                    break;
                case kYuFangCuSi:
                    title=@"预防老人猝死";
                    break;
                default:
                    title=nil;
                    break;
            };
            break;
        default:
            break;
    }
    cell.title=title;
}

#pragma mark - UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MainTableViewCell *cell=(MainTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    DetailViewController *detailVC=[[DetailViewController alloc] init];
    detailVC.indexPath=indexPath;
    detailVC.title=cell.title;
    [self.navigationController pushViewController:detailVC animated:YES];
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
