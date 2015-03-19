//
//  MainViewController.h
//  Doctor
//
//  Created by Ever on 15/3/19.
//  Copyright (c) 2015年 Ever. All rights reserved.
//

#import "BaseViewController.h"

@interface MainViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)IBOutlet UITableView *tableView;

@end
