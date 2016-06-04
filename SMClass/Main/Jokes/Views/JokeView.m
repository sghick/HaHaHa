//
//  JokeView.m
//  Hahaha
//
//  Created by buding on 15/8/17.
//  Copyright (c) 2015年 sumrise.com. All rights reserved.
//

#import "JokeView.h"
#import "UIImageView+WebCache.h"
#import "SMJoke.h"
#import "PureLayout.h"

@interface JokeView ()

@property (strong, nonatomic) UILabel *contentLabel;
@property (strong, nonatomic) UIImageView *imageView;

@end

@implementation JokeView

- (instancetype)init {
    self = [super init];
    if (self) {
        UILabel *contentLabel = [[UILabel alloc] init];
        contentLabel.font = [UIFont systemFontOfSize:15*SMWidthScale];
        contentLabel.numberOfLines = 0;
        contentLabel.lineBreakMode = NSLineBreakByCharWrapping;
        [self addSubview:contentLabel];
        self.contentLabel = contentLabel;
        
        UIImageView *imageView = [[UIImageView alloc] init];
        [self addSubview:imageView];
        self.imageView = imageView;
        
        [self setNeedsUpdateConstraints];
    }
    return self;
}

- (void)updateConstraints {
    [super updateConstraints];
    // 自动布局
    [self.contentLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:64];
    [self.contentLabel autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [self.contentLabel autoSetDimension:ALDimensionWidth toSize:SMScreenWidth - 40*SMWidthScale];
    
    [self.imageView autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [self.imageView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.contentLabel];
}

#pragma mark - setter/getter
- (void)setJoke:(SMJoke *)joke {
    if (_joke != joke) {
        _joke = joke;
        self.contentLabel.text = joke.content;
        if (joke.picUrl) {
            [self.imageView sd_setImageWithURL:[NSURL URLWithString:self.joke.picUrl]];
        }
    }
}

@end
