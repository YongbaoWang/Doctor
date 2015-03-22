//
//  DetailViewController.m
//  Doctor
//
//  Created by Ever on 15/3/20.
//  Copyright (c) 2015年 Ever. All rights reserved.
//

#import "DetailViewController.h"
#import "ViewMacro.h"
#import "DetailTableViewCell.h"

@interface DetailViewController ()
{
    NSDictionary *_dataDic;
}

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
    [self _initDataSource];
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

-(void)_initDataSource
{
    NSString *filePath=[[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"data.json"];
    NSData *data=[NSData dataWithContentsOfFile:filePath];
    NSError *err=nil;
    id object= [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&err];
    NSLog(@"%@",object);
    _dataDic=[NSDictionary dictionaryWithDictionary:object];

}

#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identity=@"myCell";
    DetailTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:identity];
    if (cell==nil) {
        cell=[[DetailTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identity];
    }

    NSString *text= _dataDic[[NSString stringWithFormat:@"%d",self.indexPath.section]][self.indexPath.row][[NSString stringWithFormat:@"%d",indexPath.row]];
    DetailInfo *model=[[DetailInfo alloc] init];
    model.text=text;
    cell.model=model;
    
    return cell;
}


#pragma mark - UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *text= _dataDic[[NSString stringWithFormat:@"%d",self.indexPath.section]][self.indexPath.row][[NSString stringWithFormat:@"%d",indexPath.row]];
    
    CGSize size=CGSizeZero;
    if ([text respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)]) {
        size= [text boundingRectWithSize:CGSizeMake(kDetailRowTextWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:kDetailRowFontSize]} context:nil].size;

    }
    else {
        size=[text sizeWithFont:[UIFont systemFontOfSize:kDetailRowFontSize] forWidth:kDetailRowTextWidth lineBreakMode:NSLineBreakByWordWrapping];

    }
    return size.height;
    
}

@end
