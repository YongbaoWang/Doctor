//
//  MainTableViewCell.m
//  Doctor
//
//  Created by Ever on 15/3/19.
//  Copyright (c) 2015年 Ever. All rights reserved.
//

#import "MainTableViewCell.h"

@implementation MainTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [self _init];
    }
    return self;
}

-(void)_init
{
    _imageView=[[UIImageView alloc] initWithFrame:CGRectMake(20, 10, 280, 80)];
    [self addSubview:_imageView];
    [self setBackgroundColor:[UIColor clearColor]];
    [self.contentView setBackgroundColor:[UIColor clearColor]];
    
    _titleLbl =[[UILabel alloc] initWithFrame:CGRectMake(100, 15, 160, 60)];
    [_titleLbl setFont:[UIFont systemFontOfSize:24.0]];
    [_imageView addSubview:_titleLbl];
}

-(void)setIndex:(NSInteger)index
{
    _imageView.image=[UIImage imageNamed:[NSString stringWithFormat:@"num_bg_%d",index]];
}

-(void)setTitle:(NSString *)title
{
    _titleLbl.text=title;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
