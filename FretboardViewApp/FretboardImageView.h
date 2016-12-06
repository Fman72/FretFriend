//
//  FretboardImageView.h
//  FretboardViewApp
//
//  Created by Fraser Kearns on 25/05/16.
//  Copyright © 2016 Unitec. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FreePlayInterfaceController.h";

@interface FretboardImageView : UIImageView

@property (strong, nonatomic) FreePlayInterfaceController *controller;

-(void)setDotWidth:(int)dotWidth AndHeight: (int)dotHeight;
-(void)drawTouchPointWithLocationsX:(int)locationX AndY:(int)locationY;

@end
