//
//  MainViewController.m
//  ObjectDrawing_ex1
//
//  Created by mac on 2018. 8. 27..
//  Copyright © 2018년 mac. All rights reserved.
//

#import "MainViewController.h"


@interface MainViewController ()
@end
@implementation MainViewController


- (IBAction)lineAction:(id)sender {
    if (linecount == 0){
        lineBtn.tintColor = UIColor.blueColor;
        circleBtn.tintColor = UIColor.darkGrayColor;
        squareBtn.tintColor = UIColor.darkGrayColor;
        linecount = 1;
        squarecount = 0;
        circlecount = 0;
    }
    else{
        lineBtn.tintColor = UIColor.darkGrayColor;
        circleBtn.tintColor = UIColor.darkGrayColor;
        squareBtn.tintColor = UIColor.darkGrayColor;
        linecount = 0;
    }
}

- (IBAction)squreAction:(id)sender {
    if (squarecount == 0){
        squareBtn.tintColor = UIColor.blueColor;
        circleBtn.tintColor = UIColor.darkGrayColor;
        lineBtn.tintColor = UIColor.darkGrayColor;
        linecount = 0;
        squarecount = 1;
        circlecount = 0;
    }
    else{
        squareBtn.tintColor = UIColor.darkGrayColor;
        circleBtn.tintColor = UIColor.darkGrayColor;
        lineBtn.tintColor = UIColor.darkGrayColor;
        squarecount = 0;
    }
}

- (IBAction)circleAction:(id)sender {
    if (circlecount == 0){
        circleBtn.tintColor = UIColor.blueColor;
        squareBtn.tintColor = UIColor.darkGrayColor;
        lineBtn.tintColor = UIColor.darkGrayColor;
        linecount = 0;
        squarecount = 0;
        circlecount = 1;
    }
    else{
        squareBtn.tintColor = UIColor.darkGrayColor;
        circleBtn.tintColor = UIColor.darkGrayColor;
        lineBtn.tintColor = UIColor.darkGrayColor;
        circlecount = 0;
    }
}

- (IBAction)allDeleteAction:(id)sender {
    
    [viewtap setEnabled:true];
//    int count = (int)self.view.subviews.count;
    printf("%d", (int)self.view.subviews.firstObject.subviews.count);
//    for(int i = 0; i < count; i ++){
//        if (!self.view.subviews.firstObject){
//            [self.view.subviews[i] removeFromSuperview];
//        }
//        else{
//            [self.view.subviews[i].subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
//        }
//    }
    
}

- (IBAction)saveAction:(id)sender {
    
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject: _paintView forKey:@"Paint"];
    [defaults synchronize];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    dotcount = 0;
    linecount = 0;
    squarecount = 0;
    circlecount = 0;
    viewtap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleviewTap:)];
    [_paintView addGestureRecognizer:viewtap];
}

- (void)handleviewTap: (UITapGestureRecognizer*)sender
{
    s.delegate = self;
    if (linecount == 1 || circlecount == 1 || squarecount == 1 ){
        CGPoint tapPoint = [sender locationInView:_paintView];
        if (linecount == 1){
            //선 생성
            s = [[ShapeView alloc]init];
            s.frame = CGRectMake(tapPoint.x -75,tapPoint.y -75, 150, 150);
            l2 = [[UIView alloc]init];
            l2.frame = CGRectMake(0.0, 75, 150, 1);
            s.backgroundColor = UIColor.clearColor;
            l2.backgroundColor = UIColor.blackColor;
            [s addSubview:l2];
            [_paintView addSubview:s];
        }
        if (circlecount == 1){
            //원 생성
            s = [[ShapeView alloc]init];
            s.frame = CGRectMake(tapPoint.x -75,tapPoint.y -75, 150, 150);
            s.layer.cornerRadius = s.frame.size.height/2;
            s.backgroundColor = UIColor.blackColor;
            [_paintView addSubview:s];
        }
        if (squarecount == 1){
            //사각형생성
            s = [[ShapeView alloc]init];
            s.frame = CGRectMake(tapPoint.x -75,tapPoint.y -75, 150, 150);
            s.backgroundColor = UIColor.blackColor;
            [_paintView addSubview:s];
        }
    }
}
- (void)canMakeNew:(Boolean)b {
    if (b == false){
        [viewtap setEnabled:false];
    }
    else if (b == true){
         [viewtap setEnabled:true];
    }
}
@end
