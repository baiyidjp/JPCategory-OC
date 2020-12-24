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
    
    UIButton *button1 = [UIButton buttonWithNormalTitle:@"垂直居中-默认图片居左-间距0" titleFont:[UIFont systemFontOfSize:15] normalTitleColor:[UIColor whiteColor] normalImage:[UIImage imageNamed:@"icon_coin24"] frame:CGRectMake(20, 10, 350, 50)];
    button1.backgroundColor = [UIColor blackColor];
//    [button1 setImagePosition];
    [scrollView addSubview:button1];
    
    UIButton *button2 = [UIButton buttonWithNormalTitle:@"垂直居中-图片居左-间距10" titleFont:[UIFont systemFontOfSize:15] normalTitleColor:[UIColor whiteColor] normalImage:[UIImage imageNamed:@"icon_coin24"] frame:CGRectMake(20, CGRectGetMaxY(button1.frame)+10, 350, 50)];
    button2.backgroundColor = [UIColor blackColor];
    [button2 setImagePosition:JPButtonImagePosition_Left margin:10];
    [scrollView addSubview:button2];
    
    UIButton *button3 = [UIButton buttonWithNormalTitle:@"垂直居中-图片居右-间距10" titleFont:[UIFont systemFontOfSize:15] normalTitleColor:[UIColor whiteColor] normalImage:[UIImage imageNamed:@"icon_coin24"] frame:CGRectMake(20, CGRectGetMaxY(button2.frame)+10, 350, 50)];
    button3.backgroundColor = [UIColor blackColor];
    [button3 setImagePosition:JPButtonImagePosition_Right margin:10];
    [scrollView addSubview:button3];
    
    UIButton *button4 = [UIButton buttonWithNormalTitle:@"垂直居中-图片居上-间距10" titleFont:[UIFont systemFontOfSize:15] normalTitleColor:[UIColor whiteColor] normalImage:[UIImage imageNamed:@"icon_coin24"] frame:CGRectZero];
    button4.frame = CGRectMake(20, CGRectGetMaxY(button3.frame)+10, 350, 80);
    NSLog(@"%@", NSStringFromCGRect(button4.titleLabel.frame));
    button4.backgroundColor = [UIColor blackColor];
    [button4 setImagePosition:JPButtonImagePosition_Top margin:10];
    [scrollView addSubview:button4];
    
    UIButton *button5 = [UIButton buttonWithNormalTitle:@"垂直居中-图片居下-间距10" titleFont:[UIFont systemFontOfSize:15] normalTitleColor:[UIColor whiteColor] normalImage:[UIImage imageNamed:@"icon_coin24"] frame:CGRectMake(20, CGRectGetMaxY(button4.frame)+10, 350, 80)];
    button5.backgroundColor = [UIColor blackColor];
    [button5 setImagePosition:JPButtonImagePosition_Bottom margin:10];
    [scrollView addSubview:button5];
    
    UIButton *button60 = [UIButton buttonWithNormalTitle:@"垂直居上-默认图片居左-间距0" titleFont:[UIFont systemFontOfSize:15] normalTitleColor:[UIColor whiteColor] normalImage:[UIImage imageNamed:@"icon_coin24"] frame:CGRectMake(20, CGRectGetMaxY(button5.frame)+10, 350, 50)];
    button60.backgroundColor = [UIColor blackColor];
    button60.contentVerticalAlignment = UIControlContentVerticalAlignmentTop;
    [scrollView addSubview:button60];
    
    UIButton *button6 = [UIButton buttonWithNormalTitle:@"垂直居上-图片居左-间距10" titleFont:[UIFont systemFontOfSize:15] normalTitleColor:[UIColor whiteColor] normalImage:[UIImage imageNamed:@"icon_coin24"] frame:CGRectMake(20, CGRectGetMaxY(button60.frame)+10, 350, 50)];
    button6.backgroundColor = [UIColor blackColor];
    button6.contentVerticalAlignment = UIControlContentVerticalAlignmentTop;
    [button6 setImagePosition:JPButtonImagePosition_Left margin:10];
    [scrollView addSubview:button6];
    
    UIButton *button7 = [UIButton buttonWithNormalTitle:@"垂直居上-图片居右-间距10" titleFont:[UIFont systemFontOfSize:15] normalTitleColor:[UIColor whiteColor] normalImage:[UIImage imageNamed:@"icon_coin24"] frame:CGRectMake(20, CGRectGetMaxY(button6.frame)+10, 350, 50)];
    button7.backgroundColor = [UIColor blackColor];
    button7.contentVerticalAlignment = UIControlContentVerticalAlignmentTop;
    [button7 setImagePosition:JPButtonImagePosition_Right margin:10];
    [scrollView addSubview:button7];

    UIButton *button8 = [UIButton buttonWithNormalTitle:@"垂直居上-图片居上-间距10" titleFont:[UIFont systemFontOfSize:15] normalTitleColor:[UIColor whiteColor] normalImage:[UIImage imageNamed:@"icon_coin24"] frame:CGRectMake(20, CGRectGetMaxY(button7.frame)+10, 350, 80)];
    button8.backgroundColor = [UIColor blackColor];
    button8.contentVerticalAlignment = UIControlContentVerticalAlignmentTop;
    [button8 setImagePosition:JPButtonImagePosition_Top margin:10];
    [scrollView addSubview:button8];

    UIButton *button9 = [UIButton buttonWithNormalTitle:@"垂直居上-图片居下-间距10" titleFont:[UIFont systemFontOfSize:15] normalTitleColor:[UIColor whiteColor] normalImage:[UIImage imageNamed:@"icon_coin24"] frame:CGRectMake(20, CGRectGetMaxY(button8.frame)+10, 350, 80)];
    button9.backgroundColor = [UIColor blackColor];
    button9.contentVerticalAlignment = UIControlContentVerticalAlignmentTop;
    [button9 setImagePosition:JPButtonImagePosition_Bottom margin:10];
    [scrollView addSubview:button9];
    
    UIButton *button10 = [UIButton buttonWithNormalTitle:@"垂直居下-默认图片居左-间距0" titleFont:[UIFont systemFontOfSize:15] normalTitleColor:[UIColor whiteColor] normalImage:[UIImage imageNamed:@"icon_coin24"] frame:CGRectMake(20, CGRectGetMaxY(button9.frame)+10, 350, 50)];
    button10.backgroundColor = [UIColor blackColor];
    button10.contentVerticalAlignment = UIControlContentVerticalAlignmentBottom;
    [scrollView addSubview:button10];
    
    UIButton *button11 = [UIButton buttonWithNormalTitle:@"垂直居下-图片居左-间距10" titleFont:[UIFont systemFontOfSize:15] normalTitleColor:[UIColor whiteColor] normalImage:[UIImage imageNamed:@"icon_coin24"] frame:CGRectMake(20, CGRectGetMaxY(button10.frame)+10, 350, 50)];
    button11.backgroundColor = [UIColor blackColor];
    button11.contentVerticalAlignment = UIControlContentVerticalAlignmentBottom;
    [button11 setImagePosition:JPButtonImagePosition_Left margin:10];
    [scrollView addSubview:button11];
    
    UIButton *button12 = [UIButton buttonWithNormalTitle:@"垂直居下-图片居右-间距10" titleFont:[UIFont systemFontOfSize:15] normalTitleColor:[UIColor whiteColor] normalImage:[UIImage imageNamed:@"icon_coin24"] frame:CGRectMake(20, CGRectGetMaxY(button11.frame)+10, 350, 50)];
    button12.backgroundColor = [UIColor blackColor];
    button12.contentVerticalAlignment = UIControlContentVerticalAlignmentBottom;
    [button12 setImagePosition:JPButtonImagePosition_Right margin:10];
    [scrollView addSubview:button12];

    UIButton *button13 = [UIButton buttonWithNormalTitle:@"垂直居下-图片居上-间距10" titleFont:[UIFont systemFontOfSize:15] normalTitleColor:[UIColor whiteColor] normalImage:[UIImage imageNamed:@"icon_coin24"] frame:CGRectMake(20, CGRectGetMaxY(button12.frame)+10, 350, 80)];
    button13.backgroundColor = [UIColor blackColor];
    button13.contentVerticalAlignment = UIControlContentVerticalAlignmentBottom;
    [button13 setImagePosition:JPButtonImagePosition_Top margin:10];
    [scrollView addSubview:button13];

    UIButton *button14 = [UIButton buttonWithNormalTitle:@"垂直居下-图片居下-间距10" titleFont:[UIFont systemFontOfSize:15] normalTitleColor:[UIColor whiteColor] normalImage:[UIImage imageNamed:@"icon_coin24"] frame:CGRectMake(20, CGRectGetMaxY(button13.frame)+10, 350, 80)];
    button14.backgroundColor = [UIColor blackColor];
    button14.contentVerticalAlignment = UIControlContentVerticalAlignmentBottom;
    [button14 setImagePosition:JPButtonImagePosition_Bottom margin:10];
    [scrollView addSubview:button14];
    
    scrollView.contentSize = CGSizeMake(self.view.frame.size.width, CGRectGetMaxY(button14.frame));
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
