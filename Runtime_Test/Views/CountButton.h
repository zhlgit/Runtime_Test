//
//  CountButton.h
//  RAC_Test
//
//  Created by jielisong on 2019/8/26.
//  Copyright © 2019 cz10000. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CountButton : UIButton

@property (nonatomic, assign) NSInteger count;

@end

@interface ClickCount : NSObject

+(instancetype)shareInstance;

-(NSInteger)clickCount;

@end

NS_ASSUME_NONNULL_END
