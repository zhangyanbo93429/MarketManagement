//
//  AddViewController.h
//  MarketManagement
//
//  Created by zhangyanbo on 2017/12/5.
//  Copyright © 2017年 zhangyanbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JiajuDatabase.h"
@interface AddViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *variety;
@property (weak, nonatomic) IBOutlet UITextField *number;
@property (weak, nonatomic) IBOutlet UITextField *priceIn;
@property (weak, nonatomic) IBOutlet UITextField *priceShow;
@property (weak, nonatomic) IBOutlet UITextField *priceOut;

@end
