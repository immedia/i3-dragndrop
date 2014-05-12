//
//  I3Example1Test.m
//  Test App
//
//  Created by Stephen Fortune on 05/04/2014.
//  Copyright (c) 2014 IceCube Software Ltd. All rights reserved.
//

#import "I3Example1Test.h"

@implementation I3Example1Test


-(void) beforeEach{
    
    [tester navigateToExampleCaseNumber:1];
    
}

-(void) afterEach{
    
}

-(void) testSrcIsRearrangeable{

    NSIndexPath* from = [NSIndexPath indexPathForRow:0 inSection:0];
    NSIndexPath* to = [NSIndexPath indexPathForRow:0 inSection:0];
    
    [tester dragCellInTableViewWithAccessibilityLabel:@"srcTable"
                                          atIndexPath:from
                    toTableViewWithAccessibilityLabel:@"srcTable"
                                          atIndexPath:to];
    
}

-(void) testDstIsRearrangeable{

}

-(void) testSrcCannotDragToDst{

}

-(void) testDstCannotDragToSrc{

}

-(void) testSrcCellsCannotBeDraggedOustideOfTable{

}

-(void) testDstCellsCannotBeDraggedOustideOfTable{
    
}

@end
