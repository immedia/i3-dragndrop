//
//  KIFUITestActor+I3DndTestAppAdditions.m
//  Test App
//
//  Created by Stephen Fortune on 05/04/2014.
//  Copyright (c) 2014 IceCube Software Ltd. All rights reserved.
//

#import "KIFUITestActor+I3DndTestAppAdditions.h"



@implementation KIFUITestActor (I3DndTestAppAdditions)


-(NSArray*) testCaseToAccessibillityMap{
    
    return @[
             @"2ReTablesTabButton",
             @"2ExTablesTabButton",
             @"2ReExTablesTabButton",
             @"tableToReTableTabButton",
             @"2ExCollectionsTabButton",
             @"col2ReColTabButtonTabButton",
             @"paintMeTabButton",
             ];
}


-(void) navigateToExampleCaseNumber:(NSInteger) testCaseNumber{

    --testCaseNumber;
    
    /** Check that the test case number exists as an example case */
    
    if(testCaseNumber < 0 || testCaseNumber >= self.testCaseToAccessibillityMap.count){
        
        [NSException raise:@"KIFUITestActor(I3DndTestAppAdditions)InvalidExampleCase"
                    format:@"Example case number %ld does not exist or is not in the text case map",
                            testCaseNumber];
    }
    
    NSString* tabButtonAccessibillityLabel = self.testCaseToAccessibillityMap[testCaseNumber];
    [self tapViewWithAccessibilityLabel:tabButtonAccessibillityLabel];
}


 @end