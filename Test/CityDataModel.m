//
//  CityDataModel.m
//  EstateClient
//
//  Created by WebUser on 17/4/18.
//  Copyright © 2017年 skynet. All rights reserved.
//

#import "CityDataModel.h"

@implementation CityDataModel

+(void)load
{
    [self mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"data" : [CityAreasModel class]};
    }];
}

@end

@implementation CityAreasModel

+(void)load
{
    [self mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"cities" : [CityModel class]};
    }];
}

@end

@implementation CityModel

@end
