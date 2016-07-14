//
//  MSColor.h
//  Jay
//
//  Created by Joshua Bell on 7/26/14.
//  Copyright (c) 2014 Joshua Bell. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MSColor : NSObject

// colors are in hex without a "#". e.g. @"FFFFFF"
-(id)initWithTopColor:(NSString *)topColor bottomColor:(NSString *)bottomColor foregroundColor:(NSString *)foregroundcolor;

@property (nonatomic) UIColor *topColor;
@property (nonatomic) UIColor *bottomColor;
@property (nonatomic) UIColor *foregroundGolor;

- (UIColor *)colorWithHexString:(NSString *)stringToConvert;
- (NSString *)topHexString;

@end
