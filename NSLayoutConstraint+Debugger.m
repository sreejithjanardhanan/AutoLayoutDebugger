//
//  NSLayoutConstraint+Debugger.m
//
//
//  Created by Sreejith Bhatt on 02/02/15.
//  Copyright (c) 2015 SB Studios. All rights reserved.
//

#import "NSLayoutConstraint+Debugger.h"
#import <objc/objc-runtime.h>

static const char viewIdentifier_key;

@implementation NSLayoutConstraint (Debugger)

- (NSString *)description
{
    NSMutableString *myDescription = [NSMutableString stringWithFormat:@"%@, ", self.asciiArtDescription];
    UIView *firstView = (UIView *)[self firstItem];
    if (firstView) {
        [myDescription appendFormat:@"First View: 0x%0x: %@, ", (int)firstView, firstView.viewIdentifier];
    }
    UIView *secondView = (UIView *)[self secondItem];
    if (secondView) {
        [myDescription appendFormat:@"Second View: 0x%0x: %@", (int)secondView, secondView.viewIdentifier];
    }
    return myDescription;
}

@end

@implementation UIView (Debugger)

- (id) viewIdentifier
{
    return objc_getAssociatedObject(self, (void *) &viewIdentifier_key);
}

- (void)setViewIdentifier:(NSString *) viewIdentifier
{
    objc_setAssociatedObject(self, (void *) &viewIdentifier_key, viewIdentifier, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)printAutoLayoutTrace
{
    #ifdef DEBUG
    NSLog(@"%@", [self performSelector:@selector(_autolayoutTrace)]);
    #endif
}

- (void)exerciseAmbiguityInLayoutRepeatedly:(BOOL)recursive
{
    #ifdef DEBUG
    if (self.hasAmbiguousLayout) {
        [NSTimer scheduledTimerWithTimeInterval:.5
                                         target:self
                                       selector:@selector(exerciseAmbiguityInLayout)
                                       userInfo:nil
                                        repeats:YES];
    }
    if (recursive) {
        for (UIView *subview in self.subviews) {
            [subview exerciseAmbiguityInLayoutRepeatedly:YES];
        }
    }
    #endif
}

@end