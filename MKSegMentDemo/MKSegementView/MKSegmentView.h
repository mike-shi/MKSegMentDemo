//
//  MKSegmentView.h
//  ChartApp
//
//  Created by mike on 16/10/13.
//  Copyright © 2016年 Smart H.S.E. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MKSegmentView;

@protocol MKSegmentViewDelegate <NSObject>

@required
/**
 *  btn的tag值 6001 为左边的的btn  6002 为右边的
 *
 *  @param BtnTag <#BtnTag description#>
 */

-(void)SegmentViewDidChanged:(UIButton *)BtnTag;

@end


@interface MKSegmentView : UIView


@property(nonatomic,weak)id<MKSegmentViewDelegate> delegate;

@property(nonatomic,copy)NSString *strL;

@property(nonatomic,copy)NSString *strR;

@property(nonatomic,strong)UIColor *TintColor;
/**
 *  快速创建
 *
 *  @return <#return value description#>
 */
-(instancetype)shareSegmentViewWithTitleL:(NSString *)strL TitleR:(NSString *)strR ;

@end
