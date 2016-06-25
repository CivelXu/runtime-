//
//  ViewController.m
//  RunTime
//
//  Created by xuxiwen on 16/6/15.
//  Copyright © 2016年 xuxiwen. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import <objc/message.h> // 实现消息机制前提导入头文件
#import "Dog.h"
#import "UIImage+Image.h"
#import "NSObject+Property.h"
#import "NSObject+DictionaryToModel.h"
#import "NSObject+Model.h"
#import "UIGestureRecognizer+Block.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    /// -----------------------    runtime 发送消息   -----------------------///
    
    // 方法的调用本质是，对象发送消息
    // objc/msgSend 只有对象才能发送消息，因此以objc开头
    // 导入 #import <objc/message.h> 或者直接导入 #import <objc/runtime.h>

    
    // 注意 Xcode 6  之后代码检查
    // builtSeting 修改 Enable Strict Checking of objc_msgSend Calls -> NO 才能调用 objc_msgSend
    
    // 案例一
    // 创建对象 -> 调用方法
    
    Dog *d = [[Dog alloc] init];
    // 调用方法 -> 实例方法
//    [d run];
    
    // 系统底层本质 -> 让对象发消息
    objc_msgSend(d, @selector(run));
    
    // 调用方法 -> 类方法
//    [Dog eat];
   
    objc_msgSend([Dog class], @selector(eat));

    // 消息机制原理
    // 对象根据方法编号SEL去映射表查找对应方法的实现
    
    
    
     /// -----------------------    runtime 交换方法   -----------------------///
    
    // 使用场景,系统自带方法功能不够用,给系统自带的方法扩展一些功能,并保存原有功能.
    
    // 实现方法 1 -> 继承系统的类, 重写方法.
    // 实现方法 2 -> runtime 交换方法
    
    UIImage *image = [UIImage imageNamed:@"123"];
    
    // 这里通过runtime 交换自定义方法 和 UIImage 自身的imageNamed: 来实现图片加载 不被渲染
    // 代码在 #import "UIImage+Image.h" 类目中
 
    
    
    /// -----------------------    runtime 动态添加方法   -----------------------///

    // 开发场景:
    // 如果一个类方法非常多,加载类到内存中的时候,会比较耗费资源,需要给给个方法生成映射表,这里可以使用动态添加方法给某个类.
    // 经典面试题 有没有使用过 performSelector 其实主要是想问你有没有动态添加过方法.
    
    // 下面是简单使用
    
    [d performSelector:@selector(jump)];
    // 默认的狗 没有jump 这个方法实现, 直接调用会出错,可以使用 performSelector 调用就不会出错.
    // --> 动态添加方法 不会报错
    
    
    
    
    /// -----------------------    runtime 给分类添加属性   -----------------------///

    // 原理给一个类声明属性,其实是本质就是给这个类添加关联,并不是直接把这个值的内存空间添加到内存空间
    
    // 这里在类目中对NSObject扩展name 属性 可以直接给属性赋值使用

    NSObject *objc = [[NSObject alloc] init];
    objc.name = @"xxx";
    NSLog(@"%@", objc.name);
    
    
    /// -----------------------    runtime 字典转模型   -----------------------///

    
    // 设计模型 : 字典转模型的第一步
    //  模型属性, 通常需要和字典中的key一一对应
    // 通过创建一个分类,专门根据字典生成对应属性的字符串 (高效率的字典转模型)
    
    NSArray *array = [NSArray arrayWithObjects:@1, @2, @3, @4, nil];
    NSMutableArray *arr = [NSMutableArray arrayWithArray:array];
    
    NSDictionary *dic = [NSDictionary dictionaryWithObject:@"dfdf" forKey:@"dfsdf"];
    
    [NSObject transformToModelByDictionary:@{@"name" : @"str", @"num" : array, @"count" : @0, @"hah": arr, @"dic" : dic}];
    
    
    // 字典转模型KVC方式
//    dic setValuesForKeysWithDictionary:<#(nonnull NSDictionary<NSString *,id> *)#>
    // 必须保证属性和字典中key值一一对应, 如果不一致 会调用 setValue:forUndefinedKey: 重写该方法可以覆盖系统方法 可以继续KVC 字典转模型
    
    // 字典转模型 -> runtime
    
    // -> MJEXtension
    
    
    //  测试
    
    NSMutableDictionary *di = [NSMutableDictionary dictionary];
    NSMutableArray *a = [NSMutableArray array];
    [a addObject:dic];
    [di setValue:a forKey:@"dic"];
    
    id model =   [NSObject modelWithDictionary:dic];
    
    NSLog(@"%@", model);
    
    
    id dmodel =   [NSObject modelWithDictionary:di];
    
    NSLog(@"%@", dmodel);
    
    
/// -----------------------    最后使用runtime 来写了通过 block回调 直接调用手势识别的action   -----------------------///

    [self.view addGestureRecognizer:[UITapGestureRecognizer xxw_gestureRecognizerWithActionBlock:^(id gestureRecognizer) {
        
        NSLog(@"点击-------");
    }]];
    
    
    [self.view addGestureRecognizer:[UILongPressGestureRecognizer xxw_gestureRecognizerWithActionBlock:^(id gestureRecognizer) {
        
        NSLog(@"长按-------");
    }]];
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end





