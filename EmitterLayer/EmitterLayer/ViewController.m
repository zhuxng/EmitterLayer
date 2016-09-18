//
//  ViewController.m
//  EmitterLayer
//
//  Created by 朱星 on 16/9/18.
//  Copyright © 2016年 zhuxing. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    [self falling];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)fireInTheHole {
    CAEmitterLayer *layer = [CAEmitterLayer layer];
    layer.frame = self.view.bounds;
    [self.view.layer addSublayer:layer];
    layer.renderMode = kCAEmitterLayerAdditive;
    
    //发射位置
    layer.position = CGPointMake(layer.frame.size.width / 2, layer.frame.size.height / 2);
    //真正创建显示效果的模板
    CAEmitterCell *emitterCell = [CAEmitterCell emitterCell];
    emitterCell.contents = (__bridge id)([UIImage imageNamed:@"下载"]).CGImage;
    
    emitterCell.birthRate = 150;
    emitterCell.lifetime = 5;
    emitterCell.color = [UIColor colorWithRed:1 green:0.5 blue:1 alpha:1].CGColor;
    emitterCell.alphaSpeed = -0.4;
    emitterCell.velocity = 50;
    emitterCell.velocityRange = 50;
    
    emitterCell.emissionRange = M_PI * 2;
    
//    将cell添加到layer上
    layer.emitterCells = @[emitterCell];
    
    
    
}

- (void)falling {
    
    self.view.layer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"下载"].CGImage);
    CAEmitterLayer *emitterLayer = [CAEmitterLayer layer];
    emitterLayer.frame = self.view.bounds;
    [self.view.layer addSublayer:emitterLayer];
    
    
    emitterLayer.position = CGPointMake(100, -30);
    emitterLayer.emitterSize = CGSizeMake(self.view.frame.size.width * 2, 0);
    emitterLayer.renderMode = kCAEmitterLayerOutline;
    emitterLayer.emitterShape = kCAEmitterLayerLine;
    
    CAEmitterCell * cell = [CAEmitterCell emitterCell];
    
    
    cell.contents = (__bridge id _Nullable)([UIImage imageNamed:@"下载"].CGImage);
    
    
    cell.scale = 0.02;
    cell.scaleRange = 0.5;
    cell.birthRate = 100;
    cell.lifetime = 80;
    cell.alphaSpeed = -0.01;
    cell.velocity = 80;
    cell.velocityRange = 60;
    //发射范围emissionRange
    cell.emissionRange = M_PI;

    //自旋转角度
    cell.spin = M_PI_4;
    //阴影效果
    emitterLayer.shadowOffset = CGSizeMake(3, 3);
    emitterLayer.shadowOpacity = 1.0;
    emitterLayer.shadowColor = [UIColor whiteColor].CGColor;
    emitterLayer.shadowRadius = 8;
    emitterLayer.emitterCells = @[cell];
    
    
    
    
    
    
}

@end
