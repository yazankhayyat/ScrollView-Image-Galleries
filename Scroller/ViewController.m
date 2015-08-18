//
//  ViewController.m
//  Scroller
//
//  Created by Yazan Khayyat on 2015-08-17.
//  Copyright (c) 2015 Yazan. All rights reserved.
//

#import "ViewController.h"
#import "NewViewController.h"

@interface ViewController () <UIScrollViewDelegate> 

@property (nonatomic, strong) UIScrollView *tapScrollView;

@property (nonatomic, strong) UIPageControl *pageControl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    scrollView.contentSize = CGSizeMake(self.view.bounds.size.width * 3 , self.view.bounds.size.height);
    scrollView.delegate = self;
    self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    self.pageControl.numberOfPages = 3;
    self.pageControl.currentPage = 0;
    self.tapScrollView = scrollView;
    [self.view addSubview:scrollView];
    [self.view addSubview:self.pageControl];
    scrollView.pagingEnabled = YES;
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGesture:)];
    [scrollView addGestureRecognizer:tapGesture];
    
    UIImageView *image1 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, scrollView.bounds.size.width, scrollView.bounds.size.height)];
    image1.image = [UIImage imageNamed:@"Lighthouse-in-Field"];
    [scrollView addSubview:image1];
    
    UIImageView *image2 = [[UIImageView alloc]initWithFrame:CGRectMake(scrollView.bounds.size.width, 0, scrollView.bounds.size.width, scrollView.bounds.size.height)];
    image2.image = [UIImage imageNamed:@"Lighthouse-night"];
    [scrollView addSubview:image2];
    
    UIImageView *image3 = [[UIImageView alloc]initWithFrame:CGRectMake(scrollView.bounds.size.width * 2, 0, scrollView.bounds.size.width, scrollView.bounds.size.height)];
    
    image3.image = [UIImage imageNamed:@"Lighthouse"];
    [scrollView addSubview:image3];
}

-(void)tapGesture: (UITapGestureRecognizer *)sender {
    
    if (self.tapScrollView.contentOffset.x == self.tapScrollView.bounds.size.width) {
        NewViewController *imageViewController = [[NewViewController alloc]init];
        imageViewController.imageName = @"Lighthouse-night";

        [self presentViewController:imageViewController animated:YES completion:^{
        }];
        
        
    } else if (self.tapScrollView.contentOffset.x == self.tapScrollView.bounds.size.width * 2) {
        NewViewController *imageViewController = [[NewViewController alloc]init];
        imageViewController.imageName = @"Lighthouse";
        
        [self presentViewController:imageViewController animated:YES completion:^{
        }];

        
    } else {
        NewViewController *imageViewController = [[NewViewController alloc]init];
        imageViewController.imageName = @"Lighthouse-in-Field";
        
        [self presentViewController:imageViewController animated:YES completion:^{
        }];

        
    }
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    if (self.tapScrollView.contentOffset.x == self.tapScrollView.bounds.size.width) {
        
        self.pageControl.currentPage = 1;
        
    } else if (self.tapScrollView.contentOffset.x == self.tapScrollView.bounds.size.width * 2) {
       
        self.pageControl.currentPage = 2;
        
    } else {
        
        self.pageControl.currentPage = 0;
        
    }
    
}




@end
