//
//  WN_Stopwatch.h
//  Stopwatch
//
//  Created by Transuner on 16/4/28.
//  Copyright © 2016年 王宁. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,WN_StopwatchLabelType){
    WNTypeStopWatch,
    WNTypeTimer
};
@class WN_Stopwatch;
@protocol WN_StopWatchDelegate <NSObject>

@optional

-(void)timerLabel:(WN_Stopwatch*)timerLabel
finshedCountDownTimerWithTime:(NSTimeInterval)countTime;

-(void)timerLabel:(WN_Stopwatch*)timerlabel
       countingTo:(NSTimeInterval)time
        timertype:(WN_StopwatchLabelType)timerType;

@end

@interface WN_Stopwatch : UILabel

@property (assign,readonly) BOOL counting;
@property (nonatomic, assign) BOOL resetTimerAfterFinish;

@property (nonatomic, strong) UILabel * timeLabel;

@property (nonatomic, strong) NSString * timeFormat;

@property (nonatomic, assign) WN_StopwatchLabelType stopwatchLabelType;

@property (nonatomic, strong) id<WN_StopWatchDelegate>delegate;

- (instancetype) initWithLabel:(UILabel *)anLabel
                  andTimerType:(WN_StopwatchLabelType)anType;

-(void)start;
#if NS_BLOCKS_AVAILABLE
-(void)startWithEndingBlock:(void(^)(NSTimeInterval countTime))end;
#endif

-(void)pause;
-(void)reset;

-(void)setCountDownTime:(NSTimeInterval)time;
-(void)setStopWatchTime:(NSTimeInterval)time;

@end
