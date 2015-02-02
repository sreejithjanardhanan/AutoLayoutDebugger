//
//  NSLayoutConstraint+Debugger.h
//
//
//  Created by Sreejith Bhatt on 02/02/15.
//  Copyright (c) 2015 SB Studios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSLayoutConstraint (Debugger)

- (NSString *)asciiArtDescription;

@end

@interface UIView (Debugger)

- (void)printAutoLayoutTrace;
- (void)_autolayoutTrace;

@property (nonatomic, strong) NSString *viewIdentifier;

@end
