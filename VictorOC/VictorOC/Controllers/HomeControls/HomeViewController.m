//
//  HomeViewController.m
//  VictorOC
//
//  Created by WebUser on 17/3/13.
//  Copyright © 2017年 tcbwork. All rights reserved.
//

#import "HomeViewController.h"

#import "HomeViewLayout.h"

@interface HomeViewController ()

@property(nonatomic, strong) HomeViewLayout *homeView;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.homeView];
    
}
#pragma mark -- 懒加载
-(HomeViewLayout *)homeView
{
    if (!_homeView) {
        _homeView = [HomeViewLayout linearLayoutWithOrientation:MyLayoutViewOrientation_Vert];
        _homeView.myLeftMargin = 0;
        _homeView.myRightMargin = 0;                          //同时指定左右边距为0表示宽度和父视图一样宽
        _homeView.myTopMargin = 0;
        _homeView.myBottomMargin = 0;
//        _homeView.heightDime.lBound(self.baseScrollView.heightDime, 10, 0.5); //高度虽然是wrapContentHeight的。但是最小的高度不能低于父视图的高度加10.
    }
    return _homeView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
