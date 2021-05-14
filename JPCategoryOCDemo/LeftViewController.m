//
//  LeftViewController.m
//  JPCategoryOCDemo
//
//  Created by baiyidjp on 2020/12/22.
//

#import "LeftViewController.h"
#import "JPCategory-OC.h"

@interface LeftViewController ()

@end

@implementation LeftViewController

- (void)viewWillDisappear:(BOOL)animated {

    [super viewWillDisappear:animated];

    if (self.jp_routeCompletion) {
        self.jp_routeCompletion(@"test");
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.view.backgroundColor = UIColor .whiteColor;

//    self.jp_parameters = @{@"a": @"bb"};
    NSLog(@"%@",self.jp_parameters);

    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:scrollView];
    
    UIButton *button1 = [UIButton jp_buttonWithNormalTitle:@"垂直居中-默认图片居左-间距0" titleFont:[UIFont systemFontOfSize:15] normalTitleColor:[UIColor whiteColor] normalImage:[UIImage imageNamed:@"icon_coin24"] frame:CGRectMake(20, 10, 350, 50)];
    button1.backgroundColor = [UIColor blackColor];
    button1.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
//    [button1 jp_buttonImagePosition];
    [scrollView addSubview:button1];
    
    UIButton *button2 = [UIButton jp_buttonWithNormalTitle:@"垂直居中-图片居左-间距10" titleFont:[UIFont systemFontOfSize:15] normalTitleColor:[UIColor whiteColor] normalImage:[UIImage imageNamed:@"icon_coin24"] frame:CGRectMake(20, CGRectGetMaxY(button1.frame) + 10, 350, 50)];
    button2.backgroundColor = [UIColor blackColor];
    button2.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [button2 jp_buttonImagePosition:JPButtonImagePosition_Left margin:10];
    [scrollView addSubview:button2];
    
    UIButton *button3 = [UIButton jp_buttonWithNormalTitle:@"垂直居中-图片居右-间距10" titleFont:[UIFont systemFontOfSize:15] normalTitleColor:[UIColor whiteColor] normalImage:[UIImage imageNamed:@"icon_coin24"] frame:CGRectMake(20, CGRectGetMaxY(button2.frame) + 10, 350, 50)];
    button3.backgroundColor = [UIColor blackColor];
    button3.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [button3 jp_buttonImagePosition:JPButtonImagePosition_Right margin:10];
    [scrollView addSubview:button3];
    
    UIButton *button4 = [UIButton jp_buttonWithNormalTitle:@"垂直居中-图片居上-间距10" titleFont:[UIFont systemFontOfSize:15] normalTitleColor:[UIColor whiteColor] normalImage:[UIImage imageNamed:@"icon_coin24"] frame:CGRectMake(20, CGRectGetMaxY(button3.frame) + 10, 350, 80)];
    button4.backgroundColor = [UIColor blackColor];
    button4.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [button4 jp_buttonImagePosition:JPButtonImagePosition_Top margin:10];
    [scrollView addSubview:button4];
    
    UIButton *button41 = [UIButton jp_buttonWithNormalTitle:@"垂直居中-图片居上-间距10" titleFont:[UIFont systemFontOfSize:15] normalTitleColor:[UIColor whiteColor] normalImage:[UIImage imageNamed:@"icon_coin24"] frame:CGRectMake(20, CGRectGetMaxY(button4.frame) + 10, 50, 10)];
    button41.backgroundColor = [UIColor blackColor];
    button41.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [button41 jp_buttonImagePosition:JPButtonImagePosition_Top margin:10];
    [scrollView addSubview:button41];
    
    UIButton *button5 = [UIButton jp_buttonWithNormalTitle:@"垂直居中-图片居下-间距10" titleFont:[UIFont systemFontOfSize:15] normalTitleColor:[UIColor whiteColor] normalImage:[UIImage imageNamed:@"icon_coin24"] frame:CGRectMake(20, CGRectGetMaxY(button41.frame) + 10, 350, 80)];
    button5.backgroundColor = [UIColor blackColor];
    button5.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [button5 jp_buttonImagePosition:JPButtonImagePosition_Bottom margin:10];
    [scrollView addSubview:button5];
    
    UIButton *button51 = [UIButton jp_buttonWithNormalTitle:@"垂直居中-图片居下-间距10" titleFont:[UIFont systemFontOfSize:15] normalTitleColor:[UIColor whiteColor] normalImage:[UIImage imageNamed:@"icon_coin24"] frame:CGRectMake(20, CGRectGetMaxY(button5.frame) + 10, 50, 10)];
    button51.backgroundColor = [UIColor blackColor];
    button51.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [button51 jp_buttonImagePosition:JPButtonImagePosition_Bottom margin:10];
    [scrollView addSubview:button51];
    
    UIButton *button60 = [UIButton jp_buttonWithNormalTitle:@"垂直居上-默认图片居左-间距0" titleFont:[UIFont systemFontOfSize:15] normalTitleColor:[UIColor whiteColor] normalImage:[UIImage imageNamed:@"icon_coin24"] frame:CGRectMake(20, CGRectGetMaxY(button51.frame) + 10, 350, 50)];
    button60.backgroundColor = [UIColor blackColor];
    button60.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    button60.contentVerticalAlignment = UIControlContentVerticalAlignmentTop;
    [scrollView addSubview:button60];
    
    UIButton *button6 = [UIButton jp_buttonWithNormalTitle:@"垂直居上-图片居左-间距10" titleFont:[UIFont systemFontOfSize:15] normalTitleColor:[UIColor whiteColor] normalImage:[UIImage imageNamed:@"icon_coin24"] frame:CGRectMake(20, CGRectGetMaxY(button60.frame) + 10, 350, 50)];
    button6.backgroundColor = [UIColor blackColor];
    button6.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    button6.contentVerticalAlignment = UIControlContentVerticalAlignmentTop;
    [button6 jp_buttonImagePosition:JPButtonImagePosition_Left margin:10];
    [scrollView addSubview:button6];
    
    UIButton *button7 = [UIButton jp_buttonWithNormalTitle:@"垂直居上-图片居右-间距10" titleFont:[UIFont systemFontOfSize:15] normalTitleColor:[UIColor whiteColor] normalImage:[UIImage imageNamed:@"icon_coin24"] frame:CGRectMake(20, CGRectGetMaxY(button6.frame) + 10, 350, 50)];
    button7.backgroundColor = [UIColor blackColor];
    button7.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    button7.contentVerticalAlignment = UIControlContentVerticalAlignmentTop;
    [button7 jp_buttonImagePosition:JPButtonImagePosition_Right margin:10];
    [scrollView addSubview:button7];

    UIButton *button8 = [UIButton jp_buttonWithNormalTitle:@"垂直居上-图片居上-间距10" titleFont:[UIFont systemFontOfSize:15] normalTitleColor:[UIColor whiteColor] normalImage:[UIImage imageNamed:@"icon_coin24"] frame:CGRectMake(20, CGRectGetMaxY(button7.frame) + 10, 350, 80)];
    button8.backgroundColor = [UIColor blackColor];
    button8.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    button8.contentVerticalAlignment = UIControlContentVerticalAlignmentTop;
    [button8 jp_buttonImagePosition:JPButtonImagePosition_Top margin:10];
    [scrollView addSubview:button8];
    
    UIButton *button81 = [UIButton jp_buttonWithNormalTitle:@"垂直居上-图片居上-间距10" titleFont:[UIFont systemFontOfSize:15] normalTitleColor:[UIColor whiteColor] normalImage:[UIImage imageNamed:@"icon_coin24"] frame:CGRectMake(20, CGRectGetMaxY(button8.frame) + 10, 50, 10)];
    button81.backgroundColor = [UIColor blackColor];
    button81.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    button81.contentVerticalAlignment = UIControlContentVerticalAlignmentTop;
    [button81 jp_buttonImagePosition:JPButtonImagePosition_Top margin:10];
    [scrollView addSubview:button81];

    UIButton *button9 = [UIButton jp_buttonWithNormalTitle:@"垂直居上-图片居下-间距10" titleFont:[UIFont systemFontOfSize:15] normalTitleColor:[UIColor whiteColor] normalImage:[UIImage imageNamed:@"icon_coin24"] frame:CGRectMake(20, CGRectGetMaxY(button81.frame) + 10, 350, 80)];
    button9.backgroundColor = [UIColor blackColor];
    button9.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    button9.contentVerticalAlignment = UIControlContentVerticalAlignmentTop;
    [button9 jp_buttonImagePosition:JPButtonImagePosition_Bottom margin:10];
    [scrollView addSubview:button9];
    
    UIButton *button91 = [UIButton jp_buttonWithNormalTitle:@"垂直居上-图片居下-间距10" titleFont:[UIFont systemFontOfSize:15] normalTitleColor:[UIColor whiteColor] normalImage:[UIImage imageNamed:@"icon_coin24"] frame:CGRectMake(20, CGRectGetMaxY(button9.frame) + 10, 50, 10)];
    button91.backgroundColor = [UIColor blackColor];
    button91.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    button91.contentVerticalAlignment = UIControlContentVerticalAlignmentTop;
    [button91 jp_buttonImagePosition:JPButtonImagePosition_Bottom margin:10];
    [scrollView addSubview:button91];
    
    UIButton *button10 = [UIButton jp_buttonWithNormalTitle:@"垂直居下-默认图片居左-间距0" titleFont:[UIFont systemFontOfSize:15] normalTitleColor:[UIColor whiteColor] normalImage:[UIImage imageNamed:@"icon_coin24"] frame:CGRectMake(20, CGRectGetMaxY(button91.frame) + 10, 350, 50)];
    button10.backgroundColor = [UIColor blackColor];
    button10.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    button10.contentVerticalAlignment = UIControlContentVerticalAlignmentBottom;
    [scrollView addSubview:button10];
    
    UIButton *button11 = [UIButton jp_buttonWithNormalTitle:@"垂直居下-图片居左-间距10" titleFont:[UIFont systemFontOfSize:15] normalTitleColor:[UIColor whiteColor] normalImage:[UIImage imageNamed:@"icon_coin24"] frame:CGRectMake(20, CGRectGetMaxY(button10.frame) + 10, 350, 50)];
    button11.backgroundColor = [UIColor blackColor];
    button11.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    button11.contentVerticalAlignment = UIControlContentVerticalAlignmentBottom;
    [button11 jp_buttonImagePosition:JPButtonImagePosition_Left margin:10];
    [scrollView addSubview:button11];
    
    UIButton *button12 = [UIButton jp_buttonWithNormalTitle:@"垂直居下-图片居右-间距10" titleFont:[UIFont systemFontOfSize:15] normalTitleColor:[UIColor whiteColor] normalImage:[UIImage imageNamed:@"icon_coin24"] frame:CGRectMake(20, CGRectGetMaxY(button11.frame) + 10, 350, 50)];
    button12.backgroundColor = [UIColor blackColor];
    button12.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    button12.contentVerticalAlignment = UIControlContentVerticalAlignmentBottom;
    [button12 jp_buttonImagePosition:JPButtonImagePosition_Right margin:10];
    [scrollView addSubview:button12];

    UIButton *button13 = [UIButton jp_buttonWithNormalTitle:@"垂直居下-图片居上-间距10" titleFont:[UIFont systemFontOfSize:15] normalTitleColor:[UIColor whiteColor] normalImage:[UIImage imageNamed:@"icon_coin24"] frame:CGRectMake(20, CGRectGetMaxY(button12.frame) + 10, 350, 80)];
    button13.backgroundColor = [UIColor blackColor];
    button13.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    button13.contentVerticalAlignment = UIControlContentVerticalAlignmentBottom;
    [button13 jp_buttonImagePosition:JPButtonImagePosition_Top margin:10];
    [scrollView addSubview:button13];
    
    UIButton *button131 = [UIButton jp_buttonWithNormalTitle:@"垂直居下-图片居上-间距10" titleFont:[UIFont systemFontOfSize:15] normalTitleColor:[UIColor whiteColor] normalImage:[UIImage imageNamed:@"icon_coin24"] frame:CGRectMake(20, CGRectGetMaxY(button13.frame) + 10, 50, 10)];
    button131.backgroundColor = [UIColor blackColor];
    button131.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    button131.contentVerticalAlignment = UIControlContentVerticalAlignmentBottom;
    [button131 jp_buttonImagePosition:JPButtonImagePosition_Top margin:10];
    [scrollView addSubview:button131];

    UIButton *button14 = [UIButton jp_buttonWithNormalTitle:@"垂直居下-图片居下-间距10" titleFont:[UIFont systemFontOfSize:15] normalTitleColor:[UIColor whiteColor] normalImage:[UIImage imageNamed:@"icon_coin24"] frame:CGRectMake(20, CGRectGetMaxY(button131.frame) + 10, 350, 80)];
    button14.backgroundColor = [UIColor blackColor];
    button14.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    button14.contentVerticalAlignment = UIControlContentVerticalAlignmentBottom;
    [button14 jp_buttonImagePosition:JPButtonImagePosition_Bottom margin:10];
    [scrollView addSubview:button14];
    
    UIButton *button141 = [UIButton jp_buttonWithNormalTitle:@"垂直居下-图片居下-间距10" titleFont:[UIFont systemFontOfSize:15] normalTitleColor:[UIColor whiteColor] normalImage:[UIImage imageNamed:@"icon_coin24"] frame:CGRectMake(20, CGRectGetMaxY(button14.frame) + 10, 350, 80)];
    button141.backgroundColor = [UIColor blackColor];
    button141.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    button141.contentVerticalAlignment = UIControlContentVerticalAlignmentBottom;
    [button141 jp_buttonImagePosition:JPButtonImagePosition_Bottom margin:10];
    [scrollView addSubview:button141];
    
    scrollView.contentSize = CGSizeMake(self.view.frame.size.width, CGRectGetMaxY(button141.frame));
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
