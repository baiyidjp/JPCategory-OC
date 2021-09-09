//
//  ViewController.m
//  JPCategoryOCDemo
//
//  Created by baiyidjp on 2020/12/22.
//

#import "ViewController.h"
#import "LeftViewController.h"
#import "JPCategory-OC.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *centerButton;
@property (weak, nonatomic) IBOutlet UIButton *leftButton;
@property (weak, nonatomic) IBOutlet UIButton *rightButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 400, 100, 100)];
    [[UIImage imageNamed:@"stey_fit_icon_play_64"] jp_asyncRoundImageWithSize:imageView.jp_size cornerRadius:30 borderWidth:10 borderColor:[UIColor redColor] completion:^(UIImage * _Nonnull image) {
        [image jp_asyncRoundImageWithSize:imageView.jp_size cornerRadius:30 borderWidth:5 borderColor:[UIColor blueColor] completion:^(UIImage * _Nonnull lastImage) {
            imageView.image = lastImage;
        }];
    }];
    [self.view addSubview:imageView];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(20, self.rightButton.jp_maxY+20, 100, 50)];
    button.backgroundColor = UIColor .blackColor;
    [button setTitle:@"测试回调" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(clickButton) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:button];
}

- (void)clickButton {

    LeftViewController *leftViewController = [[LeftViewController alloc] init];
    leftViewController.jp_parameters = @{@"left": @"yes"};
    leftViewController.jp_routeCompletion = ^(id data) {
        NSLog(@"completion: %@", data);
    };
    [self.navigationController pushViewController:leftViewController animated:YES];
}

@end
