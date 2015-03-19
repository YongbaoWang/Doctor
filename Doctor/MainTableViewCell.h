//
//  MainTableViewCell.h
//  Doctor
//
//  Created by Ever on 15/3/19.
//  Copyright (c) 2015年 Ever. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainTableViewCell : UITableViewCell
{
    UIImageView *_imageView;
    UILabel *_titleLbl;
}

@property(nonatomic,assign)NSInteger index ;
@property(nonatomic,strong)NSString *title;

@end
