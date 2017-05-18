//
//  BaseTableLayout.m
//  VictorOC
//
//  Created by WebUser on 17/4/6.
//  Copyright © 2017年 tcbwork. All rights reserved.
//

#import "BaseTableLayout.h"

@implementation BaseTableLayout

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.baseTableView];
        self.baseTableView.leftPos.equalTo(self.leftPos);
        self.baseTableView.rightPos.equalTo(self.rightPos);
        self.baseTableView.heightDime.equalTo(self.heightDime);
    }
    return self;
}

//-(void)setBaseArray:(NSMutableArray *)baseArray {
//    _baseArray = [baseArray mutableCopy];
//    [self.baseTableView reloadData];
//}

#pragma mark -- UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.section;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.item;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellId = @"baseCellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell==nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.textLabel.text = self.baseArray[indexPath.item];
    return cell;
}

#pragma mark -- 懒加载
- (UITableView *)baseTableView {
    if (!_baseTableView) {
        _baseTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _baseTableView.dataSource = self;
    }
    return _baseTableView;
}
- (NSMutableArray *)baseArray {
    if (!_baseArray) {
        _baseArray = [NSMutableArray array];
    }
    return _baseArray;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
