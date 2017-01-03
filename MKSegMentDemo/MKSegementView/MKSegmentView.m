//
//  MKSegmentView.m
//  ChartApp
//
//  Created by mike on 16/10/13.
//  Copyright © 2016年 Smart H.S.E. All rights reserved.
//

#import "MKSegmentView.h"

#import "UIControl+BlocksKit.h"
#import "UIView+Extension.h"

#define deviceScreenWidth [UIScreen mainScreen].bounds.size.width

@interface MKSegmentView()

@property(nonatomic,strong)UIView *lineView;

@end

@implementation MKSegmentView

-(void)setTintColor:(UIColor *)TintColor{

    _TintColor = TintColor;
    
    UIButton *btnL = [self viewWithTag:6001];
    
    [btnL setTitleColor:_TintColor forState:UIControlStateSelected];
    
    
    UIButton *btnR = [self viewWithTag:6002];
    
    [btnR setTitleColor:_TintColor forState:UIControlStateSelected];
    
    UIView *lineView = [self viewWithTag:6000];
    
    lineView.backgroundColor = _TintColor;
    
}


-(instancetype)shareSegmentViewWithTitleL:(NSString *)strL TitleR:(NSString *)strR {


    
    MKSegmentView *segmentView = [[MKSegmentView alloc]init];
    
    segmentView.backgroundColor = [UIColor whiteColor];
 
    UIButton *btnL = [segmentView viewWithTag:6001];
    
    [btnL setTitle:strL forState:UIControlStateNormal];
    
    
    UIButton *btnR = [segmentView viewWithTag:6002];
    
    [btnR setTitle:strR forState:UIControlStateNormal];

    
    
    return segmentView;

}

-(instancetype)init{

    if (self = [super init]) {
        
        [self setupSubViews];
    }
    return self;

}

-(void)setupSubViews{
 
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 41, deviceScreenWidth/2, 3)];
    [self addSubview:lineView];

    lineView.tag = 6000;
    
    UIView *lineView2 = [[UIView alloc]initWithFrame:CGRectMake(deviceScreenWidth/2, 12, 2, 20)];
    [self addSubview:lineView2];
    lineView2.backgroundColor = [UIColor lightGrayColor];

    UIButton *btnL = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, deviceScreenWidth/2, 44)];
    [self addSubview:btnL];
    [btnL setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    UIButton *btnR = [[UIButton alloc]initWithFrame:CGRectMake(deviceScreenWidth/2, 0, deviceScreenWidth/2, 44)];
    [self addSubview:btnR];
    [btnR setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

//让左边的btn默认选中
    btnL.selected = YES;

    
    btnL.tag = 6001;
    btnR.tag = 6002;
    
    [btnL bk_addEventHandler:^(id  _Nonnull sender) {
        
        btnL.selected = YES;
        btnR.selected = NO;
        
        UIView *view = [self viewWithTag:6000];
        
        view.x = 0;
        
        [self.delegate SegmentViewDidChanged:btnL];
        
        
    } forControlEvents:UIControlEventTouchUpInside];
    
    
    [btnR bk_addEventHandler:^(id  _Nonnull sender) {
        
        btnR.selected = YES;
        btnL.selected = NO;
        UIView *view = [self viewWithTag:6000];
        view.x = deviceScreenWidth/2;
        
        [self.delegate SegmentViewDidChanged:btnR];
        
    } forControlEvents:UIControlEventTouchUpInside];
    


}

@end
