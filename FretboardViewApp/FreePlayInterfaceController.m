//
//  ViewController.m
//  FretboardViewApp
//
//  Created by Fraser Kearns on 11/05/16.
//  Copyright © 2016 Unitec. All rights reserved.
//

#import "FreePlayInterfaceController.h"
#import "FretboardImageView.h"

@interface FreePlayInterfaceController ()
    
@end

@implementation FreePlayInterfaceController


- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)viewDidLayoutSubviews{
    self.fretboardEntity = [[FretboardEntity alloc] initWithWidth:self.fretboardImageView.frame.size.width andHeight:self.fretboardImageView.frame.size.height];
    self.fretboardImageView.controller = self;
    [self.fretboardImageView setDotWidth:self.fretboardImageView.frame.size.width/8 AndHeight:self.fretboardImageView.frame.size.height/12];
    
    if (_learnChord != NULL){
        NSMutableArray *coords = [self.fretboardEntity getCoordsForChord:_learnChord];
        
        for(NSValue *locationObject in coords){
            CGPoint location = locationObject.CGPointValue;
            [self.fretboardImageView drawTouchPointWithLocationsX:location.x AndY:location.y];
        }
    }
}


/*! This function returns a touchSet from the touches... functions to an array so that it can be worked with.
 @Param touches The touch set to be converted.
 @Return an array of touches.*/
-(NSMutableArray*)touchSetToCGPointArray:(NSSet<UITouch *> *)touches{
    NSMutableArray *touchPoints = [[NSMutableArray alloc] init];
    NSArray<UITouch*>* touchesArray = [touches allObjects];
    for(int i = 0; i < [touchesArray count]; i++){
        CGPoint touchPoint = [[touchesArray objectAtIndex:i] locationInView:self.fretboardImageView];
        //touchPoint = [self convertTouchPointToImagePoint:touchPoint];
        NSValue *value = [NSValue valueWithCGPoint:touchPoint];
        [touchPoints addObject: value];
    }
    return touchPoints;
}

/*! This function handles new touches and moving touches on the fretBoardImageView for this controller.
 @Param touches The touches from the gesture.*/
-(void)handleTouchesOnFretboardImageView:(NSSet<UITouch *> *)touches{
    //Finding location of each touch for gesture and adding to touches array.
    NSMutableArray<UITouch*> *touchPoints = [self touchSetToCGPointArray: touches];
    //Calcuating what notes were played based on touch locations.
    NSArray<NSString*> *notesForTouches = [self.fretboardEntity retrieveNotesFromTouches:touchPoints];
    //Clearing text in notes label.
    //Adding notes that were played to notes label text.
    if([notesForTouches isEqualToArray:[NSMutableArray arrayWithObjects:@"E", @"B", @"G", @"D", @"A", @"E",nil]]){
        return;
    }
    self.notesLabel.text = @"";
    for (NSString* string in notesForTouches) {
        self.notesLabel.text = [self.notesLabel.text stringByAppendingString:[NSString stringWithFormat:@"%@ ", string]];
    }
    //Adding chord that was played to chord label text.
    self.chordLabel.text = [self.fretboardEntity detectChordFromNotes:notesForTouches];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*! This function handles the touches ending on the freboardImageView for this controller.
    @Param touches The touches that ended.*/
-(void)handleTouchesEndedOnFretboardImageView:(int)numTouches{
    if(numTouches == 0){
        self.chordLabel.text = NO_CHORD;
        self.notesLabel.text = OPEN_STRING_NOTES;
    }
}



@end
