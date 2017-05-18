//
//  UIViewController+Toast.m
//  EstateBrokerage
//
//  Created by Victor on 17/1/4.
//  Copyright © 2017年 Tigo. All rights reserved.
//

#import "UIViewController+Toast.h"
#import "TCBProgressHUD.h"
#import <objc/runtime.h>

static const void *HttpRequestHUDKey = &HttpRequestHUDKey;

@implementation UIViewController (HUD)

- (TCBProgressHUD *)HUD{
    return objc_getAssociatedObject(self, HttpRequestHUDKey);
}

- (void)setHUD:(TCBProgressHUD *)HUD{
    objc_setAssociatedObject(self, HttpRequestHUDKey, HUD, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)showHudInView:(UIView *)view hint:(NSString *)hint{
    TCBProgressHUD *HUD = [[TCBProgressHUD alloc] initWithView:view];
    HUD.labelText = hint;
    [view addSubview:HUD];
    [HUD show:YES];
    [self setHUD:HUD];
}

- (void)showHint:(NSString *)hint
{
    UIView *view = [[UIApplication sharedApplication].delegate window];
    TCBProgressHUD *hud = [TCBProgressHUD showHUDAddedTo:view animated:YES];
    hud.userInteractionEnabled = NO;
    // Configure for text only and offset down
    hud.mode = TCBProgressHUDModeText;
    hud.labelText = hint;
    hud.margin = 10.f;
    hud.yOffset = 180;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:2];
}

- (void)showHint:(NSString *)hint yOffset:(float)yOffset
{
    UIView *view = [[UIApplication sharedApplication].delegate window];
    TCBProgressHUD *hud = [TCBProgressHUD showHUDAddedTo:view animated:YES];
    hud.userInteractionEnabled = NO;
    // Configure for text only and offset down
    hud.mode = TCBProgressHUDModeText;
    hud.labelText = hint;
    hud.margin = 10.f;
    hud.yOffset = 180;
    hud.yOffset += yOffset;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:2];
}

- (void)hideHud{
    [[self HUD] hide:YES];
}

@end
