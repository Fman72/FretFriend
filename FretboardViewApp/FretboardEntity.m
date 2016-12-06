//
//  FretboardEntity.m
//  FretboardViewApp
//
//  Created by Fraser Kearns on 18/05/16.
//  Copyright © 2016 Unitec. All rights reserved.
//

#import "FretboardEntity.h"

#define FRET_UNPRESSED 100
#define NUMBER_OF_NOTES_IN_CHORD 6

@interface FretboardEntity()
    //An array of notes to return to be displayed.
    @property (strong, nonatomic) NSMutableArray<NSString*>* currentNotes;

    //Instance variable that holds size of screen.
    @property (nonatomic) int fretWidth;
    @property (nonatomic) int fretHeight;

    //Arrays that model the frets on each string.
    @property (strong, nonatomic) NSArray<NSString*>* highEString;
    @property (strong, nonatomic) NSArray<NSString*>* bString;
    @property (strong, nonatomic) NSArray<NSString*>* gString;
    @property (strong, nonatomic) NSArray<NSString*>* dString;
    @property (strong, nonatomic) NSArray<NSString*>* aString;
    @property (strong, nonatomic) NSArray<NSString*>* eString;

    //An array used to model the open notes on each string.
    @property (strong, nonatomic) NSMutableArray<NSString*>* openNotes;

    //Ints that hold the presssed fret on each string.
    @property (strong, nonatomic) NSNumber* highEStringPressedFret;
    @property (strong, nonatomic) NSNumber* bStringPressedFret;
    @property (strong, nonatomic) NSNumber* gStringPressedFret;
    @property (strong, nonatomic) NSNumber* dStringPressedFret;
    @property (strong, nonatomic) NSNumber* aStringPressedFret;
    @property (strong, nonatomic) NSNumber* eStringPressedFret;

    @property (strong, nonatomic) NSMutableArray* pressedFrets;

    //Array that models the strings on the fretboard.
    @property (strong, nonatomic) NSArray<NSArray*>* strings;



    //Chord objects for holding the information about chords.
    @property (strong, nonatomic) Chord* testChord;
    @property (strong, nonatomic) Chord* cChord;
    @property (strong, nonatomic) Chord* dChord;
    @property (strong, nonatomic) Chord* eChord;
    @property (strong, nonatomic) Chord* fChord;
    @property (strong, nonatomic) Chord* gChord;
    @property (strong, nonatomic) Chord* aChord;
    @property (strong, nonatomic) Chord* bChord;
    @property (strong, nonatomic) Chord* cSharpChord;
    @property (strong, nonatomic) Chord* dSharpChord;
    @property (strong, nonatomic) Chord* fSharpChord;
    @property (strong, nonatomic) Chord* gSharpChord;
    @property (strong, nonatomic) Chord* aSharpChord;

    @property (strong, nonatomic) NSArray<Chord *>* chords;

@end


@implementation FretboardEntity

-(id)init{
    self = [self initWithWidth:100 andHeight:100];
    return self;
}


/*!
    This constructor initializes a FretboardEntity object with the size of the fretboard it will model.
    @Param view The view this fretboard entity corresponds to.
*/
-(id)initWithWidth:(int)width andHeight:(int)height{
    self = [super init];
    if(self == [super init]){
        self.fretWidth = width/4;
        self.fretHeight = height/6;

        //Initializing arrays that model fret layout on fretboard.
        self.highEString = [NSArray arrayWithObjects:@"E", @"F", @"F#", @"G", @"G#", nil];
        self.bString = [NSArray arrayWithObjects:@"B", @"C", @"C#", @"D", @"D#", nil];
        self.gString = [NSArray arrayWithObjects:@"G", @"G#", @"A", @"A#", @"B", nil];
        self.dString = [NSArray arrayWithObjects:@"D", @"D#", @"E", @"F", @"F#", nil];
        self.aString = [NSArray arrayWithObjects:@"A", @"A#", @"B", @"C", @"C#", nil];
        self.eString = [NSArray arrayWithObjects:@"E", @"F", @"F#", @"G", @"G#", nil];
        self.strings = [NSArray arrayWithObjects:self.highEString, self.bString, self.gString, self.dString, self.aString, self.eString, nil];
        
        //Initializing pressed frets to unpressed.
        self.highEStringPressedFret = [[NSNumber alloc] initWithInt:FRET_UNPRESSED];
        self.bStringPressedFret = [[NSNumber alloc] initWithInt:FRET_UNPRESSED];
        self.gStringPressedFret = [[NSNumber alloc] initWithInt:FRET_UNPRESSED];
        self.dStringPressedFret = [[NSNumber alloc] initWithInt:FRET_UNPRESSED];
        self.aStringPressedFret = [[NSNumber alloc] initWithInt:FRET_UNPRESSED];
        self.eStringPressedFret = [[NSNumber alloc] initWithInt:FRET_UNPRESSED];
        
        //Adding pressed frets to array.
        self.pressedFrets = [NSMutableArray arrayWithObjects: self.highEStringPressedFret, self.bStringPressedFret, self.gStringPressedFret, self.dStringPressedFret, self.aStringPressedFret, self.gStringPressedFret, nil];
        
        
        //Adding chord objects that hold info for recognising when a chord has been played.
        self.cChord = [[Chord alloc] initWithName:@"C" andNotes:[NSArray arrayWithObjects: @"E", @"C", @"G", @"E", @"C", @"E", nil]];
        self.dChord = [[Chord alloc] initWithName:@"D" andNotes:[NSArray arrayWithObjects: @"F#", @"D", @"A", @"D", @"A", @"E", nil]];
        self.eChord = [[Chord alloc] initWithName:@"E" andNotes:[NSArray arrayWithObjects: @"E", @"B", @"G#", @"E", @"B", @"E", nil]];
        self.fChord = [[Chord alloc] initWithName:@"F" andNotes:[NSArray arrayWithObjects: @"F", @"C", @"A", @"F", @"A", @"E", nil]];
        self.gChord = [[Chord alloc] initWithName:@"G" andNotes:[NSArray arrayWithObjects: @"G", @"B", @"G", @"D", @"B", @"G", nil]];
        self.aChord = [[Chord alloc] initWithName:@"A" andNotes:[NSArray arrayWithObjects: @"E", @"C#", @"A", @"E", @"A", @"E", nil]];
        self.bChord = [[Chord alloc] initWithName:@"B" andNotes:[NSArray arrayWithObjects: @"F#", @"D#", @"B", @"F#", @"B", @"E", nil]];
        self.cSharpChord = [[Chord alloc] initWithName:@"C" andNotes:[NSArray arrayWithObjects: @"F", @"C#", @"G#", @"F", @"A", @"E", nil]];
        self.dSharpChord = [[Chord alloc] initWithName:@"C" andNotes:[NSArray arrayWithObjects: @"G", @"D#", @"A#", @"G", @"A", @"E", nil]];
        self.fSharpChord = [[Chord alloc] initWithName:@"C" andNotes:[NSArray arrayWithObjects: @"F#", @"C#", @"A#", @"F#", @"C#", @"F#", nil]];
        self.gSharpChord = [[Chord alloc] initWithName:@"C" andNotes:[NSArray arrayWithObjects: @"G#", @"D#", @"C", @"G#", @"D#", @"G#", nil]];
        self.aSharpChord = [[Chord alloc] initWithName:@"C" andNotes:[NSArray arrayWithObjects: @"F", @"D", @"A#", @"F", @"A#", @"E", nil]];

        self.openNotes = [NSMutableArray arrayWithObjects: @"E", @"B", @"G", @"D",@"A", @"E", nil];
        
        self.testChord = [[Chord alloc] initWithName:@"Test" andNotes:[NSArray arrayWithObjects: @"F", @"B", @"G", @"D", @"A", @"E", nil]];
        
        self.chords = [NSArray arrayWithObjects:self.cChord, self.dChord, self.eChord, self.fChord, self.gChord, self.aChord, self.bChord, self.cSharpChord, self.dSharpChord, self.fSharpChord, self.gSharpChord, self.aSharpChord, self.testChord, nil];
        self.currentNotes = [NSMutableArray arrayWithObjects: [self.highEString objectAtIndex:0],  [self.bString objectAtIndex:0],  [self.gString objectAtIndex:0],  [self.dString objectAtIndex:0],  [self.aString objectAtIndex:0],  [self.eString objectAtIndex:0], nil];
    }
    return self;
}

/*! 
    This function retrieves the fret and the co-ordinates specified.
    @Param x The x co-ordinate.
 */
-(NSNumber*)getFretForPointAtX:(int)x {
    //Performing integer division as I do not want the remainder.
    //Calucating the number of the fret on the string based off the width.
    int fretIndex = x/self.fretWidth;
    //Calculating the string based of the height.
    //Returning the note at the index on the fretboard.
    return [NSNumber numberWithInt: fretIndex];
}

/*!
 This function retrieves the fret and the co-ordinates specified.
 @Param y The y co-ordiante.
 */
-(NSNumber*)getStringTouchedAtY:(int)y{
    //Performing integer division as I do not want the remainder.
    //Calculating the string based of the height.
    int stringIndex = (y/self.fretHeight);
    //Returning the note at the index on the fretboard.
    return [NSNumber numberWithInt: stringIndex];
}

/*! This function detects if a chord is being played based on the notes that have been played.
    @Param notes An array of notes that are being played.*/
-(NSString*)detectChordFromNotes:(NSArray*)notes{
    for (int i = 0; i < [self.chords count]; i++) {
        if ([notes isEqualToArray: ((Chord*)[self.chords objectAtIndex:i]).notes]) {
            Chord *currentChord = (Chord *)[self.chords objectAtIndex:i];
            return currentChord.name;
        }
    }
    return NO_CHORD;
}


/*! This function takes an array of touch co-oridnates and returns the notes that are being pressed by the user. I am not able to stop this function returning open chords therefore validation will be handled by the FretboardImageView.
    @Param touches The array of touch objects.*/
-(NSMutableArray*)retrieveNotesFromTouches:(NSMutableArray*)touches{
    //For each touch on the view.
    for(int i = 0; i < [touches count]; i++){
        //Getting the touch.
        CGPoint point = [[touches objectAtIndex:i ] CGPointValue];
        //Finding what fret was pressed from pointer to CGPoint object.
        NSNumber *stringPressed = [self getStringTouchedAtY:point.y];
        NSNumber *fretPressed = [self getFretForPointAtX:point.x];
        //If fret pressed is lower on fretboard than currently pressed fret change it.
        if(fretPressed < [self.pressedFrets objectAtIndex:stringPressed.intValue]){
            //Updating number in pressedFrets array.
            [self.pressedFrets replaceObjectAtIndex:stringPressed.intValue withObject:fretPressed];
            //Finding note corresponding to the number of the pressedFret and updating the notesToReturn array with it. Adding one to intValue of pressed fret as 0 in the index is the open string note.
            [self.currentNotes replaceObjectAtIndex:stringPressed.intValue withObject:[[self.strings objectAtIndex:stringPressed.intValue] objectAtIndex:fretPressed.intValue + 1]];
        }
    }
    return self.currentNotes;
}

/*! This function finds the choordinates of all the notes that need to be played to play the specfied chord.
    @Param chordName The name of the chord to find the co-orindates for.
    @Return An array of the co-orindates of the notes to play*/
-(NSMutableArray*)getCoordsForChord:(NSString*)chordName{
    NSArray *chordNotes = [[NSArray alloc] init];
    int i = 0;
    while ([chordNotes count] == 0){
        if([[self.chords objectAtIndex:i].name isEqualToString:chordName]){
            chordNotes = [self.chords objectAtIndex:i].notes;
        }
        i++;
    }
    NSMutableArray<NSValue*> *chordCoordinates = [[NSMutableArray alloc] init];
    for (int i = 0; i < NUMBER_OF_NOTES_IN_CHORD; i++){
        long indexOfNoteOnString = [[self.strings objectAtIndex: i ] indexOfObject: [chordNotes objectAtIndex: i]];
        if(indexOfNoteOnString != 0){
        [chordCoordinates addObject: [NSValue valueWithCGPoint:CGPointMake(((indexOfNoteOnString * self.fretWidth) - self.fretWidth/2), (((i + 1) * self.fretHeight)- self.fretHeight/2))]];
        }
    }
    return chordCoordinates;
}
@end
