//
//  ViewController.m
//  MKSegMentDemo
//
//  Created by nil on 17/1/3.
//  Copyright © 2017年 SHW. All rights reserved.
//

#import "ViewController.h"
#import "MKSegmentView.h"
#import "UIView+Extension.h"
@interface ViewController ()<MKSegmentViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    MKSegmentView *segment = [[MKSegmentView alloc]shareSegmentViewWithTitleL:@"123" TitleR:@"123" ];
    segment.TintColor = [UIColor blackColor];

    segment.frame = CGRectMake(0, 40, 375, 44);
    segment.delegate = self;
    [self.view addSubview:segment];
 
}

-(void)SegmentViewDidChanged:(UIButton *)BtnTag{

    if (BtnTag.tag == 6001) {
        self.view.backgroundColor = [UIColor whiteColor];
    }
     if(BtnTag.tag == 6002){
    
        self.view.backgroundColor = [UIColor orangeColor];
    }


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
