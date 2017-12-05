//
//  JiajuDatabase.h
//  JiajuDataBase
//
//  Created by zhangyanbo on 2017/11/30.
//  Copyright © 2017年 zhangyanbo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
@interface JiajuDatabase : NSObject

@property sqlite3 *sqlite; //创建全局sqlite对象
@property sqlite3_stmt *result;
@property NSString *databaseFilePath;
@property char* error;
@property BOOL step_result;
//初始化
- (instancetype)init;
//打开数据库
- (BOOL)openDB:(NSString *)dbname;
//关闭数据库
- (BOOL)closeDB:(NSString *)dbname;
//附着数据库
- (BOOL)attachDB:(NSString *)dbname aliasname:(NSString *)aliasname;
//创建表
- (BOOL)createStorageTable:(NSString *)tableName;
//插入数据
- (BOOL)InsertData:(NSString *)tableName variety:(NSString *)variety number:(NSString *)number priceIn:(NSString *)priceIn priceShow:(NSString *)priceShow priceOut:(NSString *)priceOut;
//查询所有数据
- (BOOL)selectAll:(NSString *)tableName;
//查询最近十条数据
- (BOOL)selectSQLWithLastten:(NSString *)tableName;
@end



