//
//  PickerTimeLayout.h
//  Test
//
//  Created by WebUser on 17/4/14.
//  Copyright © 2017年 tigo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PickerTimeLayout : UIView

@property(nonatomic, copy) void(^sureBtnBlock)(NSString *time);
@property(nonatomic, copy) void(^cancelBtnBlock)();

@end
