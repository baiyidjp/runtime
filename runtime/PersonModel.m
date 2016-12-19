//
//  PersonModel.m
//  runtime
//
//  Created by tztddong on 2016/11/1.
//  Copyright © 2016年 dongjiangpeng. All rights reserved.
//

#import "PersonModel.h"

@implementation PersonModel

- (NSString *)description{
    
    NSArray *keys = @[@"name",@"age",@"height",@"className"];
    
    return [self dictionaryWithValuesForKeys:keys].description;
}

@end
