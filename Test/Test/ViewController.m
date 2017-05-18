//
//  ViewController.m
//  Test
//
//  Created by WebUser on 17/4/13.
//  Copyright © 2017年 tigo. All rights reserved.
//

#import "ViewController.h"
#import "PickerTimeLayout.h"
#import "CityDataModel.h"


@interface ViewController ()

@property(nonatomic, strong) PickerTimeLayout  *pickerLayout;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *jsonPath = [[NSBundle mainBundle] pathForResource:@"areas_json" ofType:@"json"];
    NSData *data=[NSData dataWithContentsOfFile:jsonPath];
    NSError *error;
    id jsonObject=[NSJSONSerialization JSONObjectWithData:data
                                                  options:NSJSONReadingAllowFragments
                                                    error:&error];
    
    id modelArray = [[CityDataModel class] mj_objectWithKeyValues:jsonObject];
    
    UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 40)];
    textLabel.textAlignment = NSTextAlignmentCenter;
    textLabel.textColor = [UIColor blackColor];
    [self.view addSubview:textLabel];
    
    _pickerLayout = [[PickerTimeLayout alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height-240, self.view.frame.size.width, 240)];
    [self.view addSubview:_pickerLayout];
    
    _pickerLayout.sureBtnBlock = ^(NSString *time) {
        textLabel.text = time;
    };
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
