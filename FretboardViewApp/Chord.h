//
//  Chord.h
//  FretboardViewApp
//
//  Created by Fraser Kearns on 21/05/16.
//  Copyright © 2016 Unitec. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Chord : NSObject

-(id)initWithName:(NSString*)name andNotes:(NSArray*)notes;

@property (strong, nonatomic) NSArray* notes;

@property (strong, nonatomic) NSString* name;

@end
