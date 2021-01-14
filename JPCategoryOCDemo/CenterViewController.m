//
//  CenterViewController.m
//  JPCategoryOCDemo
//
//  Created by SteyDong on 2020/12/22.
//

#import "CenterViewController.h"
#import "JPCategory.h"

@interface CenterViewController ()

@end

@implementation CenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:scrollView];
    
    UIButton *button1 = [UIButton jp_buttonWithNormalTitle:@"垂直居中-默认图片居左-间距0" titleFont:[UIFont systemFontOfSize:15] normalTitleColor:[UIColor whiteColor] normalImage:[UIImage imageNamed:@"icon_coin24"] frame:CGRectMake(20, 10, 350, 50)];
    button1.backgroundColor = [UIColor blackColor];
//    [button1 jp_imagePosition];
    [scrollView addSubview:button1];
    
    UIButton *button2 = [UIButton jp_buttonWithNormalTitle:@"垂直居中-图片居左-间距10" titleFont:[UIFont systemFontOfSize:15] normalTitleColor:[UIColor whiteColor] normalImage:[UIImage imageNamed:@"icon_coin24"] frame:CGRectMake(20, CGRectGetMaxY(button1.frame) + 10, 350, 50)];
    button2.backgroundColor = [UIColor blackColor];
    [button2 jp_imagePosition:JPButtonImagePosition_Left margin:10];
    [scrollView addSubview:button2];
    
    UIButton *button3 = [UIButton jp_buttonWithNormalTitle:@"垂直居中-图片居右-间距10" titleFont:[UIFont systemFontOfSize:15] normalTitleColor:[UIColor whiteColor] normalImage:[UIImage imageNamed:@"icon_coin24"] frame:CGRectMake(20, CGRectGetMaxY(button2.frame) + 10, 350, 50)];
    button3.backgroundColor = [UIColor blackColor];
    [button3 jp_imagePosition:JPButtonImagePosition_Right margin:10];
    [scrollView addSubview:button3];
    
    UIButton *button4 = [UIButton jp_buttonWithNormalTitle:@"垂直居中-图片居上-间距10" titleFont:[UIFont systemFontOfSize:15] normalTitleColor:[UIColor whiteColor] normalImage:[UIImage imageNamed:@"icon_coin24"] frame:CGRectMake(20, CGRectGetMaxY(button3.frame) + 10, 350, 80)];
    button4.backgroundColor = [UIColor blackColor];
    [button4 jp_imagePosition:JPButtonImagePosition_Top margin:10];
    [scrollView addSubview:button4];
    
    UIButton *button5 = [UIButton jp_buttonWithNormalTitle:@"垂直居中-图片居下-间距10" titleFont:[UIFont systemFontOfSize:15] normalTitleColor:[UIColor whiteColor] normalImage:[UIImage imageNamed:@"icon_coin24"] frame:CGRectMake(20, CGRectGetMaxY(button4.frame) + 10, 350, 80)];
    button5.backgroundColor = [UIColor blackColor];
    [button5 jp_imagePosition:JPButtonImagePosition_Bottom margin:10];
    [scrollView addSubview:button5];
    
    UIButton *button60 = [UIButton jp_buttonWithNormalTitle:@"垂直居上-默认图片居左-间距0" titleFont:[UIFont systemFontOfSize:15] normalTitleColor:[UIColor whiteColor] normalImage:[UIImage imageNamed:@"icon_coin24"] frame:CGRectMake(20, CGRectGetMaxY(button5.frame) + 10, 350, 50)];
    button60.backgroundColor = [UIColor blackColor];
    button60.contentVerticalAlignment = UIControlContentVerticalAlignmentTop;
    [scrollView addSubview:button60];
    
    UIButton *button6 = [UIButton jp_buttonWithNormalTitle:@"垂直居上-图片居左-间距10" titleFont:[UIFont systemFontOfSize:15] normalTitleColor:[UIColor whiteColor] normalImage:[UIImage imageNamed:@"icon_coin24"] frame:CGRectMake(20, CGRectGetMaxY(button60.frame) + 10, 350, 50)];
    button6.backgroundColor = [UIColor blackColor];
    button6.contentVerticalAlignment = UIControlContentVerticalAlignmentTop;
    [button6 jp_imagePosition:JPButtonImagePosition_Left margin:10];
    [scrollView addSubview:button6];
    
    UIButton *button7 = [UIButton jp_buttonWithNormalTitle:@"垂直居上-图片居右-间距10" titleFont:[UIFont systemFontOfSize:15] normalTitleColor:[UIColor whiteColor] normalImage:[UIImage imageNamed:@"icon_coin24"] frame:CGRectMake(20, CGRectGetMaxY(button6.frame) + 10, 350, 50)];
    button7.backgroundColor = [UIColor blackColor];
    button7.contentVerticalAlignment = UIControlContentVerticalAlignmentTop;
    [button7 jp_imagePosition:JPButtonImagePosition_Right margin:10];
    [scrollView addSubview:button7];

    UIButton *button8 = [UIButton jp_buttonWithNormalTitle:@"垂直居上-图片居上-间距10" titleFont:[UIFont systemFontOfSize:15] normalTitleColor:[UIColor whiteColor] normalImage:[UIImage imageNamed:@"icon_coin24"] frame:CGRectMake(20, CGRectGetMaxY(button7.frame) + 10, 350, 80)];
    button8.backgroundColor = [UIColor blackColor];
    button8.contentVerticalAlignment = UIControlContentVerticalAlignmentTop;
    [button8 jp_imagePosition:JPButtonImagePosition_Top margin:10];
    [scrollView addSubview:button8];

    UIButton *button9 = [UIButton jp_buttonWithNormalTitle:@"垂直居上-图片居下-间距10" titleFont:[UIFont systemFontOfSize:15] normalTitleColor:[UIColor whiteColor] normalImage:[UIImage imageNamed:@"icon_coin24"] frame:CGRectMake(20, CGRectGetMaxY(button8.frame) + 10, 350, 80)];
    button9.backgroundColor = [UIColor blackColor];
    button9.contentVerticalAlignment = UIControlContentVerticalAlignmentTop;
    [button9 jp_imagePosition:JPButtonImagePosition_Bottom margin:10];
    [scrollView addSubview:button9];
    
    UIButton *button10 = [UIButton jp_buttonWithNormalTitle:@"垂直居下-默认图片居左-间距0" titleFont:[UIFont systemFontOfSize:15] normalTitleColor:[UIColor whiteColor] normalImage:[UIImage imageNamed:@"icon_coin24"] frame:CGRectMake(20, CGRectGetMaxY(button9.frame) + 10, 350, 50)];
    button10.backgroundColor = [UIColor blackColor];
    button10.contentVerticalAlignment = UIControlContentVerticalAlignmentBottom;
    [scrollView addSubview:button10];
    
    UIButton *button11 = [UIButton jp_buttonWithNormalTitle:@"垂直居下-图片居左-间距10" titleFont:[UIFont systemFontOfSize:15] normalTitleColor:[UIColor whiteColor] normalImage:[UIImage imageNamed:@"icon_coin24"] frame:CGRectMake(20, CGRectGetMaxY(button10.frame) + 10, 350, 50)];
    button11.backgroundColor = [UIColor blackColor];
    button11.contentVerticalAlignment = UIControlContentVerticalAlignmentBottom;
    [button11 jp_imagePosition:JPButtonImagePosition_Left margin:10];
    [scrollView addSubview:button11];
    
    UIButton *button12 = [UIButton jp_buttonWithNormalTitle:@"垂直居下-图片居右-间距10" titleFont:[UIFont systemFontOfSize:15] normalTitleColor:[UIColor whiteColor] normalImage:[UIImage imageNamed:@"icon_coin24"] frame:CGRectMake(20, CGRectGetMaxY(button11.frame) + 10, 350, 50)];
    button12.backgroundColor = [UIColor blackColor];
    button12.contentVerticalAlignment = UIControlContentVerticalAlignmentBottom;
    [button12 jp_imagePosition:JPButtonImagePosition_Right margin:10];
    [scrollView addSubview:button12];

    UIButton *button13 = [UIButton jp_buttonWithNormalTitle:@"垂直居下-图片居上-间距10" titleFont:[UIFont systemFontOfSize:15] normalTitleColor:[UIColor whiteColor] normalImage:[UIImage imageNamed:@"icon_coin24"] frame:CGRectMake(20, CGRectGetMaxY(button12.frame) + 10, 350, 80)];
    button13.backgroundColor = [UIColor blackColor];
    button13.contentVerticalAlignment = UIControlContentVerticalAlignmentBottom;
    [button13 jp_imagePosition:JPButtonImagePosition_Top margin:10];
    [scrollView addSubview:button13];

    UIButton *button14 = [UIButton jp_buttonWithNormalTitle:@"垂直居下-图片居下-间距10" titleFont:[UIFont systemFontOfSize:15] normalTitleColor:[UIColor whiteColor] normalImage:[UIImage imageNamed:@"icon_coin24"] frame:CGRectMake(20, CGRectGetMaxY(button13.frame) + 10, 350, 80)];
    button14.backgroundColor = [UIColor blackColor];
    button14.contentVerticalAlignment = UIControlContentVerticalAlignmentBottom;
    [button14 jp_imagePosition:JPButtonImagePosition_Bottom margin:10];
    [scrollView addSubview:button14];
    
    UIButton *button15 = [UIButton jp_buttonWithNormalTitle:@"垂直居中-宽不足-图片左" titleFont:[UIFont systemFontOfSize:15] normalTitleColor:[UIColor redColor] normalImage:[UIImage imageNamed:@"icon_coin24"] frame:CGRectMake(20, CGRectGetMaxY(button14.frame) + 10, 34, 80)];
    button15.backgroundColor = [UIColor blackColor];
    [button15 jp_imagePosition:JPButtonImagePosition_Left margin:10];
    [scrollView addSubview:button15];
    
    UIButton *button16 = [UIButton jp_buttonWithNormalTitle:@"垂直居中-宽不足-图片右" titleFont:[UIFont systemFontOfSize:15] normalTitleColor:[UIColor redColor] normalImage:[UIImage imageNamed:@"icon_coin24"] frame:CGRectMake(20, CGRectGetMaxY(button15.frame) + 10, 34, 80)];
    button16.backgroundColor = [UIColor blackColor];
    [button16 jp_imagePosition:JPButtonImagePosition_Right margin:10];
    [scrollView addSubview:button16];

    UIButton *button17 = [UIButton jp_buttonWithNormalTitle:@"垂直居中-宽不足-图片上" titleFont:[UIFont systemFontOfSize:15] normalTitleColor:[UIColor redColor] normalImage:[UIImage imageNamed:@"icon_coin24"] frame:CGRectMake(20, CGRectGetMaxY(button16.frame) + 10, 40, 30)];
    button17.backgroundColor = [UIColor blackColor];
    [button17 jp_imagePosition:JPButtonImagePosition_Top margin:10];
    [scrollView addSubview:button17];
    //stey_fit_icon_play_64
    UIButton *button171 = [UIButton jp_buttonWithNormalTitle:@"测试" titleFont:[UIFont systemFontOfSize:15] normalTitleColor:[UIColor redColor] normalImage:[UIImage imageNamed:@"stey_fit_icon_play_64"] frame:CGRectMake(20, CGRectGetMaxY(button17.frame) + 10, 70, 120)];
    button171.backgroundColor = [UIColor blackColor];
    [button171 jp_imagePosition:JPButtonImagePosition_Top margin:10];
    [scrollView addSubview:button171];
    
    UIButton *button172 = [UIButton jp_buttonWithNormalTitle:@"继续继续继续" titleFont:[UIFont systemFontOfSize:15] normalTitleColor:[UIColor redColor] normalImage:[UIImage imageNamed:@"stey_fit_icon_play_64"] frame:CGRectMake(20, CGRectGetMaxY(button171.frame) + 10, 100, 90)];
    button172.backgroundColor = [UIColor blackColor];
    [button172 jp_imagePosition:JPButtonImagePosition_Top margin:10];
    [scrollView addSubview:button172];

    UIButton *button18 = [UIButton jp_buttonWithNormalTitle:@"垂直居中-宽不足-图片下" titleFont:[UIFont systemFontOfSize:15] normalTitleColor:[UIColor redColor] normalImage:[UIImage imageNamed:@"icon_coin24"] frame:CGRectMake(20, CGRectGetMaxY(button172.frame) + 10, 34, 80)];
    button18.backgroundColor = [UIColor blackColor];
    [button18 jp_imagePosition:JPButtonImagePosition_Bottom margin:10];
    [scrollView addSubview:button18];
    
    UIButton *button181 = [UIButton jp_buttonWithNormalTitle:@"继续" titleFont:[UIFont systemFontOfSize:15] normalTitleColor:[UIColor redColor] normalImage:[UIImage imageNamed:@"stey_fit_icon_play_64"] frame:CGRectMake(20, CGRectGetMaxY(button18.frame) + 10, 64, 90)];
    button181.backgroundColor = [UIColor blackColor];
    [button181 jp_imagePosition:JPButtonImagePosition_Bottom margin:10];
    [scrollView addSubview:button181];
    
    UIButton *button182 = [UIButton jp_buttonWithNormalTitle:@"继续继续继续" titleFont:[UIFont systemFontOfSize:15] normalTitleColor:[UIColor redColor] normalImage:[UIImage imageNamed:@"stey_fit_icon_play_64"] frame:CGRectMake(20, CGRectGetMaxY(button181.frame) + 10, 100, 90)];
    button182.backgroundColor = [UIColor blackColor];
    [button182 jp_imagePosition:JPButtonImagePosition_Bottom margin:10];
    [scrollView addSubview:button182];

    UIButton *button19 = [UIButton jp_buttonWithNormalTitle:@"垂直居上-宽不足-图片左" titleFont:[UIFont systemFontOfSize:15] normalTitleColor:[UIColor redColor] normalImage:[UIImage imageNamed:@"icon_coin24"] frame:CGRectMake(20, CGRectGetMaxY(button182.frame) + 10, 34, 80)];
    button19.backgroundColor = [UIColor blackColor];
    button19.contentVerticalAlignment = UIControlContentVerticalAlignmentTop;
    [button19 jp_imagePosition:JPButtonImagePosition_Left margin:10];
    [scrollView addSubview:button19];
    
    UIButton *button20 = [UIButton jp_buttonWithNormalTitle:@"垂直居上-宽不足-图片右" titleFont:[UIFont systemFontOfSize:15] normalTitleColor:[UIColor redColor] normalImage:[UIImage imageNamed:@"icon_coin24"] frame:CGRectMake(20, CGRectGetMaxY(button19.frame) + 10, 34, 80)];
    button20.backgroundColor = [UIColor blackColor];
    button20.contentVerticalAlignment = UIControlContentVerticalAlignmentTop;
    [button20 jp_imagePosition:JPButtonImagePosition_Right margin:10];
    [scrollView addSubview:button20];

    UIButton *button21 = [UIButton jp_buttonWithNormalTitle:@"垂直居上-宽不足-图片上" titleFont:[UIFont systemFontOfSize:15] normalTitleColor:[UIColor redColor] normalImage:[UIImage imageNamed:@"icon_coin24"] frame:CGRectMake(20, CGRectGetMaxY(button20.frame) + 10, 24, 30)];
    button21.backgroundColor = [UIColor blackColor];
    button21.contentVerticalAlignment = UIControlContentVerticalAlignmentTop;
    [button21 jp_imagePosition:JPButtonImagePosition_Top margin:10];
    [scrollView addSubview:button21];
    
    UIButton *button211 = [UIButton jp_buttonWithNormalTitle:@"继续" titleFont:[UIFont systemFontOfSize:15] normalTitleColor:[UIColor redColor] normalImage:[UIImage imageNamed:@"stey_fit_icon_play_64"] frame:CGRectMake(20, CGRectGetMaxY(button21.frame) + 10, 64, 90)];
    button211.backgroundColor = [UIColor blackColor];
    button21.contentVerticalAlignment = UIControlContentVerticalAlignmentTop;
    [button211 jp_imagePosition:JPButtonImagePosition_Top margin:10];
    [scrollView addSubview:button211];
    
    UIButton *button212 = [UIButton jp_buttonWithNormalTitle:@"继续继续继续" titleFont:[UIFont systemFontOfSize:15] normalTitleColor:[UIColor redColor] normalImage:[UIImage imageNamed:@"stey_fit_icon_play_64"] frame:CGRectMake(20, CGRectGetMaxY(button211.frame) + 10, 100, 90)];
    button212.backgroundColor = [UIColor blackColor];
    button21.contentVerticalAlignment = UIControlContentVerticalAlignmentTop;
    [button212 jp_imagePosition:JPButtonImagePosition_Top margin:10];
    [scrollView addSubview:button212];


    UIButton *button22 = [UIButton jp_buttonWithNormalTitle:@"垂直居上-宽不足-图片下" titleFont:[UIFont systemFontOfSize:15] normalTitleColor:[UIColor redColor] normalImage:[UIImage imageNamed:@"icon_coin24"] frame:CGRectMake(20, CGRectGetMaxY(button212.frame) + 10, 34, 80)];
    button22.backgroundColor = [UIColor blackColor];
    button22.contentVerticalAlignment = UIControlContentVerticalAlignmentTop;
    [button22 jp_imagePosition:JPButtonImagePosition_Bottom margin:10];
    [scrollView addSubview:button22];
    
    UIButton *button221 = [UIButton jp_buttonWithNormalTitle:@"继续" titleFont:[UIFont systemFontOfSize:15] normalTitleColor:[UIColor redColor] normalImage:[UIImage imageNamed:@"stey_fit_icon_play_64"] frame:CGRectMake(20, CGRectGetMaxY(button22.frame) + 10, 64, 90)];
    button221.backgroundColor = [UIColor blackColor];
    button221.contentVerticalAlignment = UIControlContentVerticalAlignmentTop;
    [button221 jp_imagePosition:JPButtonImagePosition_Bottom margin:10];
    [scrollView addSubview:button221];
    
    UIButton *button222 = [UIButton jp_buttonWithNormalTitle:@"继续继续继续" titleFont:[UIFont systemFontOfSize:15] normalTitleColor:[UIColor redColor] normalImage:[UIImage imageNamed:@"stey_fit_icon_play_64"] frame:CGRectMake(20, CGRectGetMaxY(button221.frame) + 10, 100, 90)];
    button222.backgroundColor = [UIColor blackColor];
    button222.contentVerticalAlignment = UIControlContentVerticalAlignmentTop;
    [button222 jp_imagePosition:JPButtonImagePosition_Bottom margin:10];
    [scrollView addSubview:button222];


    UIButton *button23 = [UIButton jp_buttonWithNormalTitle:@"垂直居下-宽不足-图片左" titleFont:[UIFont systemFontOfSize:15] normalTitleColor:[UIColor redColor] normalImage:[UIImage imageNamed:@"icon_coin24"] frame:CGRectMake(20, CGRectGetMaxY(button222.frame) + 10, 34, 80)];
    button23.backgroundColor = [UIColor blackColor];
    button23.contentVerticalAlignment = UIControlContentVerticalAlignmentBottom;
    [button23 jp_imagePosition:JPButtonImagePosition_Left margin:10];
    [scrollView addSubview:button23];
    
    UIButton *button24 = [UIButton jp_buttonWithNormalTitle:@"垂直居下-宽不足-图片右" titleFont:[UIFont systemFontOfSize:15] normalTitleColor:[UIColor redColor] normalImage:[UIImage imageNamed:@"icon_coin24"] frame:CGRectMake(20, CGRectGetMaxY(button23.frame) + 10, 34, 80)];
    button24.backgroundColor = [UIColor blackColor];
    button24.contentVerticalAlignment = UIControlContentVerticalAlignmentBottom;
    [button24 jp_imagePosition:JPButtonImagePosition_Right margin:10];
    [scrollView addSubview:button24];

    UIButton *button25 = [UIButton jp_buttonWithNormalTitle:@"垂直居下-宽不足-图片上" titleFont:[UIFont systemFontOfSize:15] normalTitleColor:[UIColor redColor] normalImage:[UIImage imageNamed:@"icon_coin24"] frame:CGRectMake(20, CGRectGetMaxY(button24.frame) + 10, 24, 30)];
    button25.backgroundColor = [UIColor blackColor];
    button25.contentVerticalAlignment = UIControlContentVerticalAlignmentBottom;
    [button25 jp_imagePosition:JPButtonImagePosition_Top margin:10];
    [scrollView addSubview:button25];
    
    UIButton *button251 = [UIButton jp_buttonWithNormalTitle:@"继续" titleFont:[UIFont systemFontOfSize:15] normalTitleColor:[UIColor redColor] normalImage:[UIImage imageNamed:@"stey_fit_icon_play_64"] frame:CGRectMake(20, CGRectGetMaxY(button25.frame) + 10, 64, 90)];
    button251.backgroundColor = [UIColor blackColor];
    button251.contentVerticalAlignment = UIControlContentVerticalAlignmentBottom;
    [button251 jp_imagePosition:JPButtonImagePosition_Top margin:10];
    [scrollView addSubview:button251];
    
    UIButton *button252 = [UIButton jp_buttonWithNormalTitle:@"继续继续继续" titleFont:[UIFont systemFontOfSize:15] normalTitleColor:[UIColor redColor] normalImage:[UIImage imageNamed:@"stey_fit_icon_play_64"] frame:CGRectMake(20, CGRectGetMaxY(button251.frame) + 10, 100, 90)];
    button252.backgroundColor = [UIColor blackColor];
    button252.contentVerticalAlignment = UIControlContentVerticalAlignmentBottom;
    [button252 jp_imagePosition:JPButtonImagePosition_Top margin:10];
    [scrollView addSubview:button252];

    UIButton *button26 = [UIButton jp_buttonWithNormalTitle:@"垂直居下-宽不足-图片下" titleFont:[UIFont systemFontOfSize:15] normalTitleColor:[UIColor redColor] normalImage:[UIImage imageNamed:@"icon_coin24"] frame:CGRectMake(20, CGRectGetMaxY(button252.frame) + 10, 34, 80)];
    button26.backgroundColor = [UIColor blackColor];
    button26.contentVerticalAlignment = UIControlContentVerticalAlignmentBottom;
    [button26 jp_imagePosition:JPButtonImagePosition_Bottom margin:10];
    [scrollView addSubview:button26];

    UIButton *button261 = [UIButton jp_buttonWithNormalTitle:@"继续" titleFont:[UIFont systemFontOfSize:15] normalTitleColor:[UIColor redColor] normalImage:[UIImage imageNamed:@"stey_fit_icon_play_64"] frame:CGRectMake(20, CGRectGetMaxY(button26.frame) + 10, 64, 90)];
    button261.backgroundColor = [UIColor blackColor];
    button261.contentVerticalAlignment = UIControlContentVerticalAlignmentBottom;
    [button261 jp_imagePosition:JPButtonImagePosition_Bottom margin:10];
    [scrollView addSubview:button261];
    
    UIButton *button262 = [UIButton jp_buttonWithNormalTitle:@"继续继续继续" titleFont:[UIFont systemFontOfSize:15] normalTitleColor:[UIColor redColor] normalImage:[UIImage imageNamed:@"stey_fit_icon_play_64"] frame:CGRectMake(20, CGRectGetMaxY(button261.frame) + 10, 100, 90)];
    button262.backgroundColor = [UIColor blackColor];
    button262.contentVerticalAlignment = UIControlContentVerticalAlignmentBottom;
    [button262 jp_imagePosition:JPButtonImagePosition_Bottom margin:10];
    [scrollView addSubview:button262];
    
    scrollView.contentSize = CGSizeMake(self.view.frame.size.width, CGRectGetMaxY(button262.frame));
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
