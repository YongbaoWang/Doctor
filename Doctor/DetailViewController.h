//
//  DetailViewController.h
//  Doctor
//
//  Created by Ever on 15/3/20.
//  Copyright (c) 2015年 Ever. All rights reserved.
//

#import "BaseViewController.h"

@interface DetailViewController : BaseViewController<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)NSIndexPath *indexPath ;

@end
