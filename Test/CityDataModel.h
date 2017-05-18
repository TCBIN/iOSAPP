//
//  CityDataModel.h
//  EstateClient
//
//  Created by WebUser on 17/4/18.
//  Copyright © 2017年 skynet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJExtension.h"

@interface CityDataModel : NSObject

@property(nonatomic, strong) NSArray   *data;

@end

@interface CityAreasModel : NSObject

@property(nonatomic, copy) NSString    *areas_key;
@property(nonatomic, strong) NSArray   *cities;

@end

@interface CityModel : NSObject

@property(nonatomic, copy) NSString    *areas_id;
@property(nonatomic, copy) NSString    *areas_name;

@end
