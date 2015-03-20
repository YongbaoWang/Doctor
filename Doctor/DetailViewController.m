//
//  DetailViewController.m
//  Doctor
//
//  Created by Ever on 15/3/20.
//  Copyright (c) 2015年 Ever. All rights reserved.
//

#import "DetailViewController.h"
#import "ViewMacro.h"

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation DetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


#pragma mark - view lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self _initView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)_initView
{
    UIImageView *bgImage=[[UIImageView alloc] initWithFrame:self.view.frame];
    bgImage.image=[UIImage imageNamed:@"detail_bg"];
    [bgImage setContentMode:UIViewContentModeScaleAspectFill];
    [self.view insertSubview:bgImage atIndex:0];
    
    UIImageView *imageView=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width-20, 100)];
    imageView.image=[UIImage imageNamed:@"bg"];
    [self.tableView setTableHeaderView:imageView];
    [self.tableView setBackgroundColor:[UIColor clearColor]];
    [self.tableView setTableFooterView:[[UIView alloc] init] ];
}

#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identity=@"myCell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:identity];
    if (cell==nil) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identity];
    }
    cell.backgroundColor=[UIColor clearColor];
    [cell.contentView setBackgroundColor:[UIColor clearColor]];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    cell.textLabel.text=@"abc";
    return cell;
}

-(void)refreshCell:(UITableViewCell *)cell forRwoAtIndexPath:(NSIndexPath *)indexPath
{
//    switch (indexPath.section) {
//        case kSectionHead:
//            
//            break;
//        case kSectionHead:
//            
//            break;
//        case kSectionHead:
//            
//            break;
//        case kSectionHead:
//            
//            break;
//        case kSectionHead:
//            
//            break;
//        default:
//            break;
//    }
}

#pragma mark - UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

@end
