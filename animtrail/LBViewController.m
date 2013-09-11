//
//  LBViewController.m
//  animtrail
//
//  Created by saifuddin on 10/9/13.
//  Copyright (c) 2013 saifuddin. All rights reserved.
//

#import "LBViewController.h"

@interface LBViewController ()
{
    CGPoint lastOffset;
    NSTimeInterval lastOffsetCapture;
    BOOL isScrollingFast;
}
@end

@implementation LBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIScrollView *popularSearchScroller = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 200)];
    popularSearchScroller.delegate = self;
    popularSearchScroller.contentSize = CGSizeMake(self.view.frame.size.width*1.3, 200);
    popularSearchScroller.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:popularSearchScroller];

    
//    for (int i = 3, delta = 12; i < 9; i++, delta-=2)
//    {
//        UIImageView *vShadow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"img.png"]];
//        vShadow.frame = CGRectMake(150, 50 - delta, 50, 50);
////        vShadow.alpha = 0.2 + (i - 3)/10;
//        vShadow.tag = i;
//        //    vShadow.backgroundColor = [UIColor redColor];
//        [popularSearchScroller addSubview:vShadow];
//    }

    UIImageView *vShadow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"img.png"]];
    vShadow.frame = CGRectMake(150 + 12, 50 - 12, 50 - 12*2, 50);
    vShadow.alpha = 0.2;
    vShadow.tag = 8;
//    vShadow.backgroundColor = [UIColor redColor];
    [popularSearchScroller addSubview:vShadow];

    vShadow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"img.png"]];
    vShadow.frame = CGRectMake(150 + 10, 50 - 10, 50 - 10*2, 50);
    vShadow.alpha = 0.3;
    vShadow.tag = 7;
//    vShadow.backgroundColor = [UIColor redColor];
    [popularSearchScroller addSubview:vShadow];

    vShadow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"img.png"]];
    vShadow.frame = CGRectMake(150 + 8, 50 - 8, 50 - 8*2, 50);
    vShadow.alpha = 0.4;
    vShadow.tag = 6;
//    vShadow.backgroundColor = [UIColor redColor];
    [popularSearchScroller addSubview:vShadow];

    vShadow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"img.png"]];
    vShadow.frame = CGRectMake(150 + 6, 50 - 6, 50 - 6*2, 50);
    vShadow.alpha = 0.5;
    vShadow.tag = 5;
//    vShadow.backgroundColor = [UIColor redColor];
    [popularSearchScroller addSubview:vShadow];

    vShadow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"img.png"]];
    vShadow.frame = CGRectMake(150 + 4, 50 - 4, 50 - 4*2, 50);
    vShadow.alpha = 0.6;
    vShadow.tag = 4;
//    vShadow.backgroundColor = [UIColor redColor];
    [popularSearchScroller addSubview:vShadow];

    vShadow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"img.png"]];
    vShadow.frame = CGRectMake(150 + 2, 50 - 2, 50 - 2*2, 50);
    vShadow.alpha = 0.7;
    vShadow.tag = 3;
//    vShadow.backgroundColor = [UIColor redColor];
    [popularSearchScroller addSubview:vShadow];

    UIImageView *vOri = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"img.png"]];
    vOri.frame = CGRectMake(150, 50, 50, 50);
    vOri.tag = 2;
//    vOri.backgroundColor = [UIColor greenColor];
    [popularSearchScroller addSubview:vOri];

//    for (int i = 0; i < 6; i++)
//    {
//        UIView *v = [[UIView alloc] initWithFrame:CGRectMake((10*i + 5) + 80*i, 5, 90, 90)];
//        v.backgroundColor = (i%2 == 0) ? [UIColor greenColor] : [UIColor redColor];
//        [popularSearchScroller addSubview:v];
//    }
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView // called on finger up as we are moving
{
    UIView *vOri = [scrollView viewWithTag:2];
//    UIView *vShadow = [scrollView viewWithTag:3];
//    vShadow = [scrollView viewWithTag:3];
//    vShadow = [scrollView viewWithTag:4];
//    vShadow = [scrollView viewWithTag:5];
//    vShadow = [scrollView viewWithTag:6];
//    vShadow = [scrollView viewWithTag:7];
//    vShadow = [scrollView viewWithTag:8];
    
            [UIView animateWithDuration:0.1
                                  delay:0.1
                                options:UIViewAnimationOptionCurveLinear
                             animations:^{
                                 for (int i = 3, delta = 2; i < 9; i++, delta+=2)
                                 {
                                     UIView *vShadow = [scrollView viewWithTag:i];
                                     vShadow.frame = CGRectMake(vOri.frame.origin.x + delta, vShadow.frame.origin.y, vShadow.frame.size.width, vShadow.frame.size.height);
                                 }
                             }
                             completion:^(BOOL f){
                             }];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    UIView *vOri = [scrollView viewWithTag:2];
//    UIView *vShadow = [scrollView viewWithTag:3];
    
    CGPoint currentOffset = scrollView.contentOffset;
    NSTimeInterval currentTime = [NSDate timeIntervalSinceReferenceDate];
    
    NSTimeInterval timeDiff = currentTime - lastOffsetCapture;
    if(timeDiff > 0.1) {
        CGFloat distance = currentOffset.x - lastOffset.x;
        NSLog(@"%.2f",distance);
        
        CGFloat distanceAbs = fabsf(distance);
        
        CGFloat delta = 0.75;

        for (int i = 3; i < 9; i++)
        {
            UIImageView *vShadow = (UIImageView *)[scrollView viewWithTag:i];

            if (distance < 0)
            {
                if (distance < -5.0)
                {
                    vShadow.frame = CGRectMake(vShadow.frame.origin.x - ((i-2)*delta), vShadow.frame.origin.y, vShadow.frame.size.width, vShadow.frame.size.height);
                }
            }
            else
            {
                if (distance > 5.0)
                {
                    vShadow.frame = CGRectMake(vShadow.frame.origin.x + ((i-2)*delta), vShadow.frame.origin.y, vShadow.frame.size.width, vShadow.frame.size.height);
                }            
            }
        }
//        else if (distance < -10.0)
        
        lastOffset = currentOffset;
        lastOffsetCapture = currentTime;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
