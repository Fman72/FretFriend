//
//  FretboardImageView.m
//  FretboardViewApp
//
//  Created by Fraser Kearns on 25/05/16.
//  Copyright © 2016 Unitec. All rights reserved.
//

#import "FretboardImageView.h"

@interface FretboardImageView()

@property (nonatomic) int numTouches;
@property (nonatomic) int dotWidth;
@property (nonatomic) int dotHeight;
@property (nonatomic) UIColor *dotColour;
@end

@implementation FretboardImageView

-(void)setDotWidth:(int)dotWidth AndHeight: (int)dotHeight{
    self.dotWidth = dotWidth;
    self.dotHeight = dotHeight;
    self.dotColour = [UIColor colorWithRed:0.2 green:0.8 blue:0.9 alpha:0.7];

    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.numTouches += [touches count];
    [self.controller handleTouchesOnFretboardImageView: event.allTouches];
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.controller handleTouchesOnFretboardImageView:event.allTouches];
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.numTouches -= [touches count];
    [self.controller handleTouchesEndedOnFretboardImageView:self.numTouches];
}

-(void)drawTouchPointWithLocationsX:(int)locationX AndY:(int)locationY{
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    
    int left = locationX - (_dotWidth/2);
    int top = locationY - (_dotHeight/2);
    
    CGRect rectangle = CGRectMake(left, top, _dotWidth, _dotHeight);
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:rectangle];
    shapeLayer.path = path.CGPath;
    shapeLayer.fillColor = _dotColour.CGColor;
    
    [self.layer addSublayer:shapeLayer];
}


@end
