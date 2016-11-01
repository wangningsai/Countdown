//
//  ViewController.m
//  Stopwatch
//
//  Created by Transuner on 16/4/28.
//  Copyright © 2016年 王宁. All rights reserved.
//

#import "ViewController.h"
#import "WN_Stopwatch.h"

@interface ViewController ()<WN_StopWatchDelegate>
{
    WN_Stopwatch * stopWatchLabel;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    stopWatchLabel = [[WN_Stopwatch alloc]initWithLabel:_CustomLabel andTimerType:WNTypeTimer];
    stopWatchLabel.delegate = self;
    [stopWatchLabel setTimeFormat:@"HH:mm:ss SS"];
    [stopWatchLabel setCountDownTime:10];//多少秒 （1分钟 == 60秒）
    
}
- (IBAction)Start:(id)sender {
    [stopWatchLabel start];
}
- (IBAction)Paus:(id)sender {
    [stopWatchLabel pause];
}
- (IBAction)Reset:(id)sender {
    [stopWatchLabel reset];
}

//时间到了
-(void)timerLabel:(WN_Stopwatch*)timerLabel finshedCountDownTimerWithTime:(NSTimeInterval)countTime{
    
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"抢购时间结束" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        NSLog(@"countTime:%f",countTime);
    }];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
}

//开始倒计时
-(void)timerLabel:(WN_Stopwatch*)timerlabel
       countingTo:(NSTimeInterval)time
        timertype:(WN_StopwatchLabelType)timerType {
    NSLog(@"time:%f",time);
    
}
@end
