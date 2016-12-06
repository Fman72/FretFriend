//
//  FretboardEntity.h
//  FretboardViewApp
//
//  Created by Fraser Kearns on 18/05/16.
//  Copyright © 2016 Unitec. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Chord.h"

@interface FretboardEntity : NSObject

#define NO_CHORD @"NO CHORD";
#define OPEN_STRING_NOTES @"E B G D A E"

-(id)init;
-(id)initWithWidth:(int)width andHeight:(int)height;

-(NSMutableArray*)retrieveNotesFromTouches:(NSMutableArray*)touches;
-(NSString*)detectChordFromNotes:(NSArray*)notes;
-(NSMutableArray*)getCoordsForChord:(NSString*)chordName;


@end
