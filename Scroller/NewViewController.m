//
//  NewViewController.m
//  Scroller
//
//  Created by Yazan Khayyat on 2015-08-17.
//  Copyright (c) 2015 Yazan. All rights reserved.
//

#import "NewViewController.h"

@interface NewViewController ()

@property (nonatomic, strong) UIImageView *lightHouseImage;


@end

@implementation NewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    UIScrollView *newScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height + 400)];
    [self.view addSubview:newScrollView];
    UIImageView *newImage = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 500, 500)];
    self.lightHouseImage = newImage;
    newImage.image = [UIImage imageNamed:self.imageName];
    [newScrollView addSubview:newImage];
    newScrollView.translatesAutoresizingMaskIntoConstraints = NO;
    newImage.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint *imageTopConstraint = [NSLayoutConstraint constraintWithItem:newImage attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:newScrollView attribute:NSLayoutAttributeTop multiplier:1 constant:0];
    
    NSLayoutConstraint *imageBottomConstraint = [NSLayoutConstraint constraintWithItem:newImage attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:newScrollView attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
    
    NSLayoutConstraint *imageRightConstraint = [NSLayoutConstraint constraintWithItem:newImage attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:newScrollView attribute:NSLayoutAttributeRight multiplier:1 constant:0];
    
    NSLayoutConstraint *imageLeftConstraint = [NSLayoutConstraint constraintWithItem:newImage attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:newScrollView attribute:NSLayoutAttributeLeft multiplier:1 constant:0];
    
    NSArray *imageConstraints = @[imageTopConstraint,
                                imageBottomConstraint,
                                imageRightConstraint,
                                imageLeftConstraint];
    
    
    [self.view addConstraints:imageConstraints];
    
    NSLayoutConstraint *viewTopConstraint = [NSLayoutConstraint constraintWithItem:newScrollView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:0];
    
    NSLayoutConstraint *viewBottomConstraint = [NSLayoutConstraint constraintWithItem:newScrollView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
    
    NSLayoutConstraint *viewRightConstraint = [NSLayoutConstraint constraintWithItem:newScrollView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1 constant:0];
    
    NSLayoutConstraint *viewLeftConstraint = [NSLayoutConstraint constraintWithItem:newScrollView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1 constant:0];
    
    NSArray *viewConstraints = @[viewTopConstraint,
                                viewBottomConstraint,
                                viewRightConstraint,
                                viewLeftConstraint];
    
    
    [self.view addConstraints:viewConstraints];
    
    newScrollView.minimumZoomScale = 0.5;
    newScrollView.maximumZoomScale = 10;
    newScrollView.delegate = self;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.lightHouseImage;
    
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
