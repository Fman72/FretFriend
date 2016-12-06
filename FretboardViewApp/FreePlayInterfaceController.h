//
//  ViewController.h
//  FretboardViewApp
//
//  Created by Fraser Kearns on 11/05/16.
//  Copyright © 2016 Unitec. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FretboardEntity.h"
@class FretboardImageView;

@interface FreePlayInterfaceController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *chordLabel;
@property (strong, nonatomic) IBOutlet UILabel *notesLabel;
@property (nonatomic) NSString *learnChord;
@property (strong, nonatomic) IBOutlet FretboardImageView *fretboardImageView;
@property (strong, nonatomic) IBOutlet FretboardEntity *fretboardEntity;

-(void)handleTouchesOnFretboardImageView:(NSSet<UITouch *> *)touches;
-(void)handleTouchesEndedOnFretboardImageView:(int)numTouches;

@end

