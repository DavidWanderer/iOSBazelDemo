//
//  ViewController.m
//  AppDemo
//
//  Created by tingyue on 5/8/23.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self _addViews];
}

// 添加测试控件
- (void)_addViews {

    [self.view addSubview:self.imageView];
    CGFloat screenW = [[UIScreen mainScreen] bounds].size.width;
    CGFloat screenH = [[UIScreen mainScreen] bounds].size.height;
    CGFloat imageH = 300;
    CGFloat imageY = (screenH - imageH) / 2.0;
    self.imageView.frame = CGRectMake(0, imageY, screenW, imageH);

}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        _imageView.image = [UIImage imageNamed:@"Test"];
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _imageView;
}


@end
