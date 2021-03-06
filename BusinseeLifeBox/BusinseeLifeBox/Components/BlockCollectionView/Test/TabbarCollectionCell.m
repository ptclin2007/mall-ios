//
//  TabbarCollectionCell.m
//  UbunGit_OC
//
//  Created by admin on 2019/6/21.
//  Copyright © 2019 admin. All rights reserved.
//

#import "TabbarCollectionCell.h"

@implementation TabbarCollectionCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {

        self.iconImage = [UIImageView new];
        _iconImage.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:_iconImage];
        _iconImage.contentMode = UIViewContentModeScaleAspectFill;
        _iconImage.clipsToBounds = YES;
        [_iconImage setImage:[UIImage imageNamed:@"家-icon-白色"]];

        self.titleLab = [UILabel new];
        _titleLab.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:_titleLab];
        _titleLab.contentMode = UIViewContentModeScaleAspectFill;
        _titleLab.clipsToBounds = YES;
        _titleLab.text = @"首页";
        _titleLab.font = [UIFont boldSystemFontOfSize:10];
        _titleLab.textColor = [UIColor ug_hexString:@"#BFBFBF"];
 
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.bottom.mas_equalTo(self.mas_bottom).mas_offset(@-7);
    }];
    [_iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.top.mas_equalTo(self).offset(7);
        make.bottom.mas_equalTo(self.titleLab.mas_top).offset(-5);
    }];
  
}

-(void)setSelected:(BOOL)selected{
    if (selected) {
        _titleLab.textColor = [UIColor ug_hexString:@"#FFFFFF"];
    }else{
        _titleLab.textColor = [UIColor ug_hexString:@"#BFBFBF"];
    }
    
}

@end
