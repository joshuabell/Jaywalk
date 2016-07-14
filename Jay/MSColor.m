//
//  MSColor.m
//  Jay
//
//  Created by Joshua Bell on 7/26/14.
//  Copyright (c) 2014 Joshua Bell. All rights reserved.
//

#import "MSColor.h"

@interface MSColor ()
- (UIColor *) colorWithHexString: (NSString *) stringToConvert;
@property (copy, nonatomic) NSString *topHexString;
@property (copy, nonatomic) NSString *bottomHexString;
@end

@implementation MSColor

-(id)initWithTopColor:(NSString *)aTopColor bottomColor:(NSString *)aBottomColor foregroundColor:(NSString *)aForegroundColor
{
    
    if ( self = [super init] )
    {
        
        _topHexString = aTopColor;
        _bottomHexString = aBottomColor;
        self.topColor = [self colorWithHexString:aTopColor];
        self.bottomColor = [self colorWithHexString:aBottomColor];
        self.foregroundGolor = [self colorWithHexString:aForegroundColor];
    }
    
    return self;
}

- (NSString *)topHexString
{
    
    return [NSString stringWithString:_topHexString];
}

- (UIColor *)colorWithHexString:(NSString *)stringToConvert
{
	NSString *cString = [[stringToConvert stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
	
	// String should be 6 or 8 characters
	if ([cString length] < 6) return [UIColor whiteColor];
	
	// strip 0X if it appears
	if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
	
	if ([cString length] != 6) return [UIColor whiteColor];
    
	// Separate into r, g, b substrings
	NSRange range;
	range.location = 0;
	range.length = 2;
	NSString *rString = [cString substringWithRange:range];
	
	range.location = 2;
	NSString *gString = [cString substringWithRange:range];
	
	range.location = 4;
	NSString *bString = [cString substringWithRange:range];
	
	// Scan values
	unsigned int r, g, b;
	[[NSScanner scannerWithString:rString] scanHexInt:&r];
	[[NSScanner scannerWithString:gString] scanHexInt:&g];
	[[NSScanner scannerWithString:bString] scanHexInt:&b];
	
	return [UIColor colorWithRed:((float) r / 255.0f)
						   green:((float) g / 255.0f)
							blue:((float) b / 255.0f)
						   alpha:1.0f];
}

//- (UIColor *)topColor
//{
//
//    NSLog( @"color i-> %@", _topHexString );
//    return _topColor;
//}
//
//- (UIColor *)bottomColor
//{
//
//    NSLog( @"color i-> %@", _bottomHexString);
//    return _bottomColor;
//}


@end
