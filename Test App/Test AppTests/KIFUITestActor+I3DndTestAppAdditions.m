//
//  KIFUITestActor+I3DndTestAppAdditions.m
//  Test App
//
//  Created by Stephen Fortune on 05/04/2014.
//  Copyright (c) 2014 IceCube Software Ltd. All rights reserved.
//

#import "KIFUITestActor+I3DndTestAppAdditions.h"
#import "UIWindow-KIFAdditions.h"
#import "UIAccessibilityElement-KIFAdditions.h"
#import "UIView-KIFAdditions.h"
#import "NSError-KIFAdditions.h"
#import "CGGeometry-KIFAdditions.h"


@implementation KIFUITestActor (I3DndTestAppAdditions)


-(NSArray*) testCaseToAccessibillityMap{
    
    return @[
             @"2 Re Tables",
             @"2ExTablesTabButton",
             @"2ReExTablesTabButton",
             @"tableToReTableTabButton",
             @"2ExCollectionsTabButton",
             @"col2ReColTabButtonTabButton",
             @"paintMeTabButton",
             ];
}

-(UIView*) mainSuperview{
    return [[[UIApplication sharedApplication] keyWindow] subviews].lastObject;
}

-(UIView*) viewForAccessibilityLabel:(NSString*) label{
    
    UIAccessibilityElement* accessibility = nil;
    UIView* view = nil;
    
    [self waitForAccessibilityElement:&accessibility
                                 view:&view
                            withLabel:label
                                value:nil
                               traits:UIAccessibilityTraitNone
                             tappable:NO];
    
    return view;

}

-(void) dragCellInTableViewWithAccessibilityLabel:(NSString*) fromLabel
                                      atIndexPath:(NSIndexPath*) from
                toTableViewWithAccessibilityLabel:(NSString*) toLabel
                                      atIndexPath:(NSIndexPath*) to{

    /** Loads table views from accessibility labels */
    
    UITableView* toTable = (UITableView*)[self viewForAccessibilityLabel:toLabel];
    UITableView* fromTable = (UITableView*)[self viewForAccessibilityLabel:fromLabel];
    UIView* superview = [self mainSuperview];
    
    
    /** Grab rects and points for for index paths */
    
    CGRect fromRect = [fromTable rectForRowAtIndexPath:from];
    CGRect toRect = [toTable rectForRowAtIndexPath:to];
    
    CGPoint fromPoint = CGPointCenteredInRect(fromRect);
    CGPoint toPoint = CGPointCenteredInRect(toRect);
    
    
    /** Translate the points into superview's coords and drag */
    
    CGPoint fromInSuperview = [superview convertPoint:fromPoint fromView:fromTable];
    CGPoint toInSuperview = [superview convertPoint:toPoint fromView:toTable];
    
    [superview dragFromPoint:fromInSuperview toPoint:toInSuperview];
    
}

-(void) dragCellInTableViewWithAccessibilityLabel:(NSString*) fromLabel
                                      atIndexPath:(NSIndexPath*) from
                toCollectionViewWithAccessibilityLabel:(NSString*) toLabel
                                      atIndexPath:(NSIndexPath*) to{

    /** Loads table/collection views from accessibility labels */
    
    //UICollectionView* toCollection = (UICollectionView*)[self viewForAccessibilityLabel:toLabel];
    //UITableView* fromTable = (UITableView*)[self viewForAccessibilityLabel:fromLabel];

    // TODO: Implement

}

-(void) dragCellInCollectionViewWithAccessibilityLabel:(NSString*) fromLabel
                                           atIndexPath:(NSIndexPath*) from
                     toTableViewWithAccessibilityLabel:(NSString*) toLabel
                                           atIndexPath:(NSIndexPath*) to{

    /** Loads table/collection views from accessibility labels */
    
    //UITableView* toTable = (UITableView*)[self viewForAccessibilityLabel:toLabel];
    //UICollectionView* fromCollection = (UICollectionView*)[self viewForAccessibilityLabel:fromLabel];

    // TODO: Implement

}

-(void) dragCellInCollectionViewWithAccessibilityLabel:(NSString*) fromLabel
                                           atIndexPath:(NSIndexPath*) from
                toCollectionViewWithAccessibilityLabel:(NSString*) toLabel
                                           atIndexPath:(NSIndexPath*) to{

    /** Loads collection views from accessibility labels */
    
    //UICollectionView* toCollection = (UICollectionView*)[self viewForAccessibilityLabel:toLabel];
    //UICollectionView* fromCollection = (UICollectionView*)[self viewForAccessibilityLabel:fromLabel];

    // TODO: Implement

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