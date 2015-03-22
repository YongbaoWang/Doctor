//
//  DetailTableViewCell.m
//  Doctor
//
//  Created by Ever on 15/3/22.
//  Copyright (c) 2015年 Ever. All rights reserved.
//

#import "DetailTableViewCell.h"
#import "ViewMacro.h"

@implementation DetailTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [self _init];
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
    [self _init];
}

-(void)_init
{
    self.backgroundColor=[UIColor clearColor];
    [self.contentView setBackgroundColor:[UIColor clearColor]];
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    self.textLabel.numberOfLines=0;
    self.textLabel.font=[UIFont boldSystemFontOfSize:kDetailRowFontSize-2];
    self.textLabel.textColor=[UIColor brownColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setModel:(DetailInfo *)model
{
    _model=model;
    self.textLabel.text=model.text;
}

@end
