//
//  PickerTimeLayout.m
//  Test
//
//  Created by WebUser on 17/4/14.
//  Copyright © 2017年 tigo. All rights reserved.
//

#import "PickerTimeLayout.h"

#define allHours @[@"0点",@"1点",@"2点",@"3点",@"4点",@"5点",@"6点",@"7点",@"8点",@"9点",@"10点",@"11点",@"12点",@"13点",@"14点",@"15点",@"16点",@"17点",@"18点",@"19点",@"20点",@"21点",@"22点",@"23点"];
#define allMinutes @[@"0分",@"5分",@"10分",@"15分",@"20分",@"25分",@"30分",@"35分",@"40分",@"45分",@"50分",@"55分"];

@interface PickerTimeLayout ()<UIPickerViewDataSource,UIPickerViewDelegate>
{
    UIPickerView *_picker;
    UIButton     *_cancelButton;
    UIButton     *_sureButton;
    BOOL         dayFirst;
    BOOL         hourFirst;
}

@property(nonatomic, strong) NSMutableArray *dayArray;
@property(nonatomic, strong) NSMutableArray *hourArray;
@property(nonatomic, strong) NSMutableArray *minuteArray;

@property(nonatomic, strong) NSMutableArray *hourCopyArray;
@property(nonatomic, strong) NSMutableArray *minuteCopyArray;

@end

@implementation PickerTimeLayout

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        dayFirst = YES;
        hourFirst = YES;
        [self getTime];
        [self.hourArray addObjectsFromArray:self.hourCopyArray];
        [self.minuteArray addObjectsFromArray:self.minuteCopyArray];
        _cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _cancelButton.frame = CGRectMake(10, 7, 60, 36);
        [_cancelButton setTitle:@"取消" forState:UIControlStateNormal];
        [_cancelButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        [_cancelButton addTarget:self action:@selector(cancelButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:_cancelButton];
        _sureButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _sureButton.frame = CGRectMake(frame.size.width-70, 7, 60, 36);
        [_sureButton setTitle:@"确定" forState:UIControlStateNormal];
        [_sureButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        [_sureButton addTarget:self action:@selector(sureButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_sureButton];
        _picker = [[UIPickerView alloc]initWithFrame:CGRectMake(0, 50, frame.size.width, frame.size.height-50)];
        [self addSubview:_picker];
        _picker.delegate = self;
        _picker.dataSource = self;
        _picker.showsSelectionIndicator = YES;
    }
    return self;
}
- (void)getTime {
    NSDateFormatter *dayformat = [[NSDateFormatter alloc] init];
    [dayformat setDateFormat:@"yyyy-MM-dd"];
    NSDateFormatter *hourformat = [[NSDateFormatter alloc] init];
    [hourformat setDateFormat:@"HH"];
    NSDateFormatter *minuteformat = [[NSDateFormatter alloc] init];
    [minuteformat setDateFormat:@"mm"];
    //获取今天
    NSDate *nowDate = [NSDate date];
    NSString *todayHour = [hourformat stringFromDate:nowDate];
    NSString *todayMinute = [minuteformat stringFromDate:nowDate];
    [self.dayArray removeAllObjects];
    [self.hourCopyArray removeAllObjects];
    [self.minuteCopyArray removeAllObjects];
    if (todayHour.integerValue==23) {
        [self.dayArray addObjectsFromArray:@[@"明天",@"后天"]];
        for (int h=0; h<24; h++) {
            [self.hourCopyArray addObject:[NSString stringWithFormat:@"%d点",h]];
        }
        if (todayMinute.intValue/5==11) {
            for (int m=0; m<12; m++) {
                [self.minuteCopyArray addObject:[NSString stringWithFormat:@"%d分",m*5]];
            }
        }else{
            for (int m=todayMinute.intValue/5+1; m<12; m++) {
                [self.minuteCopyArray addObject:[NSString stringWithFormat:@"%d分",m*5]];
            }
        }
    }else{
        [self.dayArray addObjectsFromArray:@[@"今天",@"明天",@"后天"]];
        for (int h=todayHour.intValue+1; h<24; h++) {
            [self.hourCopyArray addObject:[NSString stringWithFormat:@"%d点",h]];
        }
        if (todayMinute.intValue/5==11) {
            for (int m=0; m<12; m++) {
                [self.minuteCopyArray addObject:[NSString stringWithFormat:@"%d分",m*5]];
            }
        }else{
            for (int m=todayMinute.intValue/5+1; m<12; m++) {
                [self.minuteCopyArray addObject:[NSString stringWithFormat:@"%d分",m*5]];
            }
        }
    }
}

#pragma -mark - picker view delegate

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 3;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    switch (component) {
        case 0:
            return [self.dayArray count];
            break;
        case 1:
            return [self.hourArray count];
            break;
        case 2:
            return [self.minuteArray count];
            break;
        default:
            break;
    }
    return 0;
}
-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    switch (component) {
        case 0:
        {
            return self.dayArray[row];
        }
            break;
        case 1:
        {
            return self.hourArray[row];
        }
            break;
        case 2:
        {
            return self.minuteArray[row];
        }
            break;
        default:
            break;
    }
    return nil;
}

//获取滚轮标题
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    
    if (component == 0) {
        [self.hourArray removeAllObjects];
        [self.minuteArray removeAllObjects];
        if (row==0) {
            dayFirst = YES;
            [self getTime];
            [self.hourArray addObjectsFromArray:self.hourCopyArray];
            [self.minuteArray addObjectsFromArray:self.minuteCopyArray];
        }else{
            dayFirst = NO;
            NSArray *allHourArray = allHours;
            [self.hourArray addObjectsFromArray:allHourArray];
            NSArray *allMinuteArray = allMinutes;
            [self.minuteArray addObjectsFromArray:allMinuteArray];
        }
        [_picker selectRow:0 inComponent:1 animated:YES];
        [_picker selectRow:0 inComponent:2 animated:YES];
    }
    if (component == 1) {
        [self.minuteArray removeAllObjects];
        if (row==0) {
            hourFirst = YES;
            [self getTime];
            [self.minuteArray addObjectsFromArray:self.minuteCopyArray];
        }else{
            hourFirst = NO;
            NSArray *allMinuteArray = allMinutes;
            [self.minuteArray addObjectsFromArray:allMinuteArray];
        }
        [_picker selectRow:0 inComponent:2 animated:YES];
    }
    if (component == 2) {
        [self.hourArray removeAllObjects];
        [self.minuteArray removeAllObjects];
        [self.minuteArray removeAllObjects];
        [self getTime];
        if (dayFirst) {
            [self.hourArray addObjectsFromArray:self.hourCopyArray];
        }else{
            NSArray *allHourArray = allHours;
            [self.hourArray addObjectsFromArray:allHourArray];
        }
        if (hourFirst) {
            [self.minuteArray addObjectsFromArray:self.minuteCopyArray];
        }else{
            NSArray *allMinuteArray = allMinutes;
            [self.minuteArray addObjectsFromArray:allMinuteArray];
        }
    }
    [_picker reloadAllComponents];
    
    
}
- (void)sureButtonClick:(UIButton *)sender {
    NSString *dayString = self.dayArray[[_picker selectedRowInComponent:0]];
    NSString *hourString = self.hourArray[[_picker selectedRowInComponent:1]];
    NSString *minuteString = self.minuteArray[[_picker selectedRowInComponent:2]];
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"yyyy年MM月dd日"];
    if ([dayString isEqualToString:@"今天"]) {
        //获取今天
        NSDate *nowDate = [NSDate date];
        dayString = [format stringFromDate:nowDate];
    }else if ([dayString isEqualToString:@"明天"]) {
        //获取明天
        NSDate *tomorrowDate = [NSDate dateWithTimeIntervalSinceNow:24*60*60];
        dayString = [format stringFromDate:tomorrowDate];
    }else if ([dayString isEqualToString:@"后天"]) {
        //获取后天
        NSDate *acquiredDate = [NSDate dateWithTimeIntervalSinceNow:(24*60*60)*2];
        dayString = [format stringFromDate:acquiredDate];
    }
    if (self.sureBtnBlock) {
        self.sureBtnBlock([NSString stringWithFormat:@"%@ %@%@",dayString,hourString,minuteString]);
    }
}
- (void)cancelButtonClick:(UIButton *)sender {
    if (self.cancelBtnBlock) {
        self.cancelBtnBlock();
    }
}

#pragma mark - 懒加载

- (NSMutableArray *)dayArray {
    if (!_dayArray) {
        _dayArray = [NSMutableArray array];
    }
    return _dayArray;
}
- (NSMutableArray *)hourArray {
    if (!_hourArray) {
        _hourArray = [NSMutableArray array];
    }
    return _hourArray;
}
- (NSMutableArray *)minuteArray {
    if (!_minuteArray) {
        _minuteArray = [NSMutableArray array];
    }
    return _minuteArray;
}
- (NSMutableArray *)hourCopyArray {
    if (!_hourCopyArray) {
        _hourCopyArray = [NSMutableArray array];
    }
    return _hourCopyArray;
}
- (NSMutableArray *)minuteCopyArray {
    if (!_minuteCopyArray) {
        _minuteCopyArray = [NSMutableArray array];
    }
    return _minuteCopyArray;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
