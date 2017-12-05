//
//  ViewController.m
//  MarketManagement
//
//  Created by zhangyanbo on 2017/12/4.
//  Copyright © 2017年 zhangyanbo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)addCargo:(UIButton *)sender {
}
- (IBAction)select:(UIButton *)sender {

}



- (void)viewDidLoad {
    [super viewDidLoad];
    JiajuDatabase *jd = [[JiajuDatabase alloc]init];
    [jd openDB:@"main.db"];
    [jd attachDB:@"main.db" aliasname:@"alias.db"];
    [jd createStorageTable:@"storage"];
    [jd InsertData:@"storage" variety:@"品种例" number:@"型号例" priceIn:@"进价例" priceShow:@"标价例" priceOut:@"出货例"];
    [jd selectAll:@"storage"];
    //[_tableView setValue:nil forKey:@"123"];
    //[_tableView setValue:@"" forKey:@"Jello"];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
