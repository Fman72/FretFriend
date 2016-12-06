//
//  Chord.m
//  FretboardViewApp
//
//  Created by Fraser Kearns on 21/05/16.
//  Copyright © 2016 Unitec. All rights reserved.
//

#import "Chord.h"

@implementation Chord

/*! This intializes a chord object with a name and an array of notes.
    @Param name The name of the chord.
    @Param notes The notes to play the chord.*/
-(id)initWithName:(NSString*)name andNotes:(NSArray*)notes{
    self = [super init];
    if(self == [super init]){
        self.name = name;
        self.notes = notes;
    }
    return self;
}

@end
