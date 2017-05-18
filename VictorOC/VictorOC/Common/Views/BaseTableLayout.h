//
//  BaseTableLayout.h
//  VictorOC
//
//  Created by WebUser on 17/4/6.
//  Copyright © 2017年 tcbwork. All rights reserved.
//

#import <MyLayout/MyLayout.h>

@interface BaseTableLayout : MyLinearLayout<UITableViewDataSource>

/** 基础TableView */
@property(nonatomic, strong) UITableView    *baseTableView;
/** 设置数据源 */
@property(nonatomic, strong) NSMutableArray *baseArray;
/** 设置区 */
@property(nonatomic, assign) NSInteger      section;
/** 设置行 */
@property(nonatomic, assign) NSInteger      item;

@end
