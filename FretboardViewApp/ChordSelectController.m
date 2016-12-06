//
//  ChordSelectController.m
//  FretboardViewApp
//
//  Created by Josh Prow on 29/05/16.
//  Copyright © 2016 Unitec. All rights reserved.
//

#import "ChordSelectController.h"
#import "FreePlayInterfaceController.h"

@implementation ChordSelectController

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    UIButton *button = sender;
    
    if([segue.identifier isEqualToString:@"showDetailSegue"]){
        FreePlayInterfaceController *freePlayInterfaceController = (FreePlayInterfaceController *)segue.destinationViewController;
        
        switch (button.tag){
            case 1:
                freePlayInterfaceController.learnChord = @"C";
                break;
            case 2:
                freePlayInterfaceController.learnChord = @"D";
                break;
            case 3:
                freePlayInterfaceController.learnChord = @"E";
                break;
            case 4:
                freePlayInterfaceController.learnChord = @"F";
                break;
            case 5:
                freePlayInterfaceController.learnChord = @"G";
                break;
            case 6:
                freePlayInterfaceController.learnChord = @"A";
                break;
        }
        
    }
}
@end
