//
//  HomeViewLayout.m
//  VictorOC
//
//  Created by WebUser on 17/3/13.
//  Copyright © 2017年 tcbwork. All rights reserved.
//

#import "HomeViewLayout.h"

@interface HomeViewLayout()<UITableViewDelegate>

@end

@implementation HomeViewLayout

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self.baseArray addObjectsFromArray:@[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"0"]];
        self.section = 1;
        self.item = self.baseArray.count;
    }
    return self;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
