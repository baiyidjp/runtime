//
//  ViewController.m
//  runtime
//
//  Created by tztddong on 16/9/5.
//  Copyright © 2016年 dongjiangpeng. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>

#import "NSObject+runtime.h"
#import "PersonModel.h"

#import "ViewController1.h"
#import "ViewController2.h"

@interface ViewController ()
@property(nonatomic,assign)NSInteger assinC;
@property(nonatomic,strong)NSString *strS;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    [self go_runtime];
    [self property_runtime];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)go_runtime{
    
    NSLog(@"%s",__func__);
    
    NSString *key;
    unsigned int outCount = 0;
    Ivar *ivars = class_copyIvarList([self class], &outCount);
    for (int i = 0; i < outCount; i++) {
        Ivar curIvar = ivars[i];
        const char *ivarType = ivar_getTypeEncoding(curIvar);
        NSString *type = [NSString stringWithCString:ivarType encoding:NSUTF8StringEncoding];
//        if (![type hasPrefix:@"@"]) {
//            continue;
//        }

        key = [NSString stringWithUTF8String:ivar_getName(curIvar)];
        NSLog(@"key %@ type %@ ",key,type);
    }
    free(ivars);
//    NSLog(@"key %@ type %@ ",key,ivarType);
    
}

#pragma mark - 字典转模型
- (void)property_runtime{
    
    NSArray *modelPros = [PersonModel jp_getPropertis];
    NSLog(@"%@",modelPros);
    
    NSDictionary *dict = @{@"name":@"lisi",
                           @"className":@"zhang",
                           @"age":@18,
                           @"height":@1.80,
                           @"kanke":@"kankan"};
    PersonModel *model = [PersonModel jp_objcWithDict:dict];
    NSLog(@"%@",model);
    
    NSArray *arr = [PersonModel jp_objcWithDictArray:@[dict,dict]];
    
    NSLog(@"%@",arr);
}

- (IBAction)btn1:(id)sender {
    
    ViewController1 *c1 = [[ViewController1 alloc]init];
    [self.navigationController pushViewController:c1 animated:YES];
    
}
- (IBAction)btn2:(id)sender {
    
    ViewController2 *c1 = [[ViewController2 alloc]init];
    [self.navigationController pushViewController:c1 animated:NO];
}

@end
