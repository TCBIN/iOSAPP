//
//  MyViewLayout.m
//  VictorOC
//
//  Created by WebUser on 17/4/6.
//  Copyright © 2017年 tcbwork. All rights reserved.
//

#import "MyViewLayout.h"

@implementation MyViewLayout

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self.baseArray addObjectsFromArray:@[@"0",@"9",@"8",@"7",@"6",@"5",@"4",@"3",@"2",@"1"]];
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
