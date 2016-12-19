//
//  PersonModel.h
//  runtime
//
//  Created by tztddong on 2016/11/1.
//  Copyright © 2016年 dongjiangpeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PersonModel : NSObject

@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *className;
@property(nonatomic,assign)NSInteger age;
@property(nonatomic,assign)double height;

@end
