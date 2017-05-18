//
//  ChatRecordTool.h
//  VictorOC
//
//  Created by WebUser on 17/4/5.
//  Copyright © 2017年 tcbwork. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SingletonClass.h"

@interface ChatRecordTool : NSObject

SingletonClassH(Tool)

//以文件夹形式存放聊天记录
- (BOOL)writeToArrayFile:(NSArray *)arrayObject folder:(NSString *)folder fileName:(NSString *)fileName;

- (NSArray *)readArrayFile:(NSString *)folder fileName:(NSString *)fileName;

//以字典形式存放聊天记录
- (BOOL)writeToDictionaryFile:(NSMutableDictionary *)dictionaryObject fileName:(NSString *)fileName;

- (NSMutableDictionary *)writeToDictionaryFile:(NSString *)fileName;



@end
