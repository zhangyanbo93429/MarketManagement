//
//  JiajuDatabase.m
//  JiajuDataBase
//
//  Created by zhangyanbo on 2017/11/30.
//  Copyright © 2017年 zhangyanbo. All rights reserved.
//

#import "JiajuDatabase.h"

@implementation JiajuDatabase
//初始化
- (instancetype)init
{
    self = [super init];
    if (self) {
        _sqlite = nil;
        _result = nil;
        _databaseFilePath = nil;
        _error = nil;
        _step_result = false;
    }
    return self;
}
//打开数据库
- (BOOL)openDB:(NSString *)dbname
{
    
   
    _databaseFilePath = [NSHomeDirectory() stringByAppendingString:@"/Documents/"];
    _databaseFilePath = [_databaseFilePath stringByAppendingString:dbname];

    if (sqlite3_open([_databaseFilePath UTF8String], &_sqlite) == SQLITE_OK) {
        _step_result = true;
    } else {
        _step_result = false;
    }
    return _step_result;
}
//关闭数据库
- (BOOL)closeDB
{
    sqlite3_close(_sqlite);
    return true;
}
//附着数据库
- (BOOL)attachDB:(NSString *)dbname aliasname:(NSString *)aliasname
{
    NSString *attachSql = [[NSString alloc]initWithFormat:@"attach database '%@' as '%@'" ,dbname,aliasname];
   
    return true;
}
//创建表
- (BOOL)createStorageTable:(NSString *)tableName
{
    NSString *createSql = @"create table if not exists ";
    createSql = [createSql stringByAppendingString:tableName];
    createSql = [createSql stringByAppendingString:@"(id integer primary key autoincrement, variety text, number text, priceIn text,priceShow text,priceOut text)"];
    if (sqlite3_exec(_sqlite, [createSql UTF8String], NULL, NULL, &_error) == SQLITE_OK) {
        _step_result = true;
    } else {
        _step_result = false;
        // 每次使用完毕清空 error 字符串，提供给下一次使用
        sqlite3_free(_error);
    }
    return _step_result;
}


//插入列
- (BOOL)AddColumn:(NSString *)tableName
{
    NSString *createSql = @"add column ";
    return _step_result;
}
//插入数据
- (BOOL)InsertData:(NSString *)tableName variety:(NSString *)variety number:(NSString *)number priceIn:(NSString *)priceIn priceShow:(NSString *)priceShow priceOut:(NSString *)priceOut{
    
    NSString *insertSql = [[NSString alloc]initWithFormat:@"insert into %@ (variety,number,priceIn,priceShow,priceOut) values('%@','%@','%@','%@','%@')", tableName,variety,number,priceIn,priceShow,priceOut];
    if (sqlite3_exec(_sqlite, [insertSql UTF8String], NULL, NULL, &_error) == SQLITE_OK) {
        _step_result = true;
    } else {
        _step_result = false;
        
        // 每次使用完毕清空 error 字符串，提供给下一次使用
        sqlite3_free(_error);
    }
    
    return _step_result;
}
//查询所有数据
- (BOOL)selectAll:(NSString *)tableName
{
    sqlite3_stmt *statement;
    
    // @"select * from myTable"  查询所有 key 值内容
    NSString *selectSql = [[NSString alloc]initWithFormat:@"select variety,number,priceIn,priceShow,priceOut from %@",tableName];
    
    
    if (sqlite3_prepare_v2(_sqlite, [selectSql UTF8String], -1, &statement, nil) == SQLITE_OK) {
        
        while(sqlite3_step(statement) == SQLITE_ROW) {
            
            // 查询 variety 的值
            NSString *_variety = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
        
            // 查询 number 的值
            NSString *_numbrer = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 1)];
            
            // 查询 priceIn
            NSString *_priceIn = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 2)];
            
            // 查询 priceShow 的值
            NSString *priceShow = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 3)];
            
            // 查询 priceOut 的值
            NSString *priceOut = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 4)];
            
            _step_result = true;
        }
    } else {
        _step_result = false;
    }
    
    sqlite3_finalize(statement);
    return _step_result;
}
//查询最近10条数据
- (BOOL)selectSQLWithLastten:(NSString *)tableName
{
    sqlite3_stmt *statement;
    
    // @"select * from myTable"  查询所有 key 值内容
    NSString *selectSql = [[NSString alloc]initWithFormat:@"select variety,number,priceIn,priceShow,priceOut from %@",tableName];
  
    return _step_result;
}
@end
