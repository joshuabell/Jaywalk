//
//  MSIOSColorData.m
//  Jay
//
//  Created by Joshua Bell on 7/26/14.
//  Copyright (c) 2014 Joshua Bell. All rights reserved.
//

#import "MSIOSColorData.h"
#import "MSColor.h"

@implementation MSIOSColorData

-(id)init
{
    
    if ( self = [super init] )
    {
        
        // colors from http://ios7colors.com
        NSMutableArray *colors = [NSMutableArray array];
        [colors addObject:[[MSColor alloc] initWithTopColor:@"FF53EA" bottomColor:@"FF5E3A" foregroundColor:@"333333"]];
        [colors addObject:[[MSColor alloc] initWithTopColor:@"FF9500" bottomColor:@"FF9500" foregroundColor:@"333333"]];
//        [colors addObject:[[MSColor alloc] initWithTopColor:@"FFDB4C" bottomColor:@"FFCD02" foregroundColor:@"333333"]];
        [colors addObject:[[MSColor alloc] initWithTopColor:@"FFCD02" bottomColor:@"FFCD02" foregroundColor:@"333333"]];

//        [colors addObject:[[MSColor alloc] initWithTopColor:@"87FC70" bottomColor:@"0BD318" foregroundColor:@"333333"]];
        [colors addObject:[[MSColor alloc] initWithTopColor:@"0BD318" bottomColor:@"0BD318" foregroundColor:@"333333"]];

//        [colors addObject:[[MSColor alloc] initWithTopColor:@"52EDC7" bottomColor:@"52EDC7" foregroundColor:@"333333"]];
        [colors addObject:[[MSColor alloc] initWithTopColor:@"5AC8FB" bottomColor:@"5AC8FB" foregroundColor:@"333333"]];

        [colors addObject:[[MSColor alloc] initWithTopColor:@"1AD6FD" bottomColor:@"1D62F0" foregroundColor:@"333333"]];
        [colors addObject:[[MSColor alloc] initWithTopColor:@"1D62F0" bottomColor:@"1D62F0" foregroundColor:@"333333"]];

        [colors addObject:[[MSColor alloc] initWithTopColor:@"C644FC" bottomColor:@"C644FC" foregroundColor:@"333333"]];
        [colors addObject:[[MSColor alloc] initWithTopColor:@"5856D6" bottomColor:@"5856D6" foregroundColor:@"333333"]];

        [colors addObject:[[MSColor alloc] initWithTopColor:@"5856D6" bottomColor:@"5856D6" foregroundColor:@"333333"]];
        [colors addObject:[[MSColor alloc] initWithTopColor:@"C643FC" bottomColor:@"C643FC" foregroundColor:@"333333"]];

//        [colors addObject:[[MSColor alloc] initWithTopColor:@"4A4A4A" bottomColor:@"2B2B2B" foregroundColor:@"FFFFFF"]];
//        [colors addObject:[[MSColor alloc] initWithTopColor:@"DBDDDE" bottomColor:@"DBDDDE" foregroundColor:@"333333"]];
        [colors addObject:[[MSColor alloc] initWithTopColor:@"898C90" bottomColor:@"898C90" foregroundColor:@"333333"]];


        [colors addObject:[[MSColor alloc] initWithTopColor:@"FF3B30" bottomColor:@"FF3B30" foregroundColor:@"333333"]];
        [colors addObject:[[MSColor alloc] initWithTopColor:@"FF9500" bottomColor:@"FF9500" foregroundColor:@"333333"]];
        [colors addObject:[[MSColor alloc] initWithTopColor:@"FFCC00" bottomColor:@"FFCC00" foregroundColor:@"333333"]];
        [colors addObject:[[MSColor alloc] initWithTopColor:@"4CD964" bottomColor:@"4CD964" foregroundColor:@"333333"]];
        [colors addObject:[[MSColor alloc] initWithTopColor:@"34AADC" bottomColor:@"34AADC" foregroundColor:@"333333"]];
        [colors addObject:[[MSColor alloc] initWithTopColor:@"007AFF" bottomColor:@"007AFF" foregroundColor:@"333333"]];
//        [colors addObject:[[MSColor alloc] initWithTopColor:@"5856D6" bottomColor:@"5856D6" foregroundColor:@"FFFFFF"]];
        [colors addObject:[[MSColor alloc] initWithTopColor:@"FF2D55" bottomColor:@"FF2D55" foregroundColor:@"333333"]];
        [colors addObject:[[MSColor alloc] initWithTopColor:@"8E8E93" bottomColor:@"8E8E93" foregroundColor:@"333333"]];
//        [colors addObject:[[MSColor alloc] initWithTopColor:@"C7C7CC" bottomColor:@"C7C7CC" foregroundColor:@"333333"]];

        [colors addObject:[[MSColor alloc] initWithTopColor:@"C86EDF" bottomColor:@"C86EDF" foregroundColor:@"333333"]];
//        [colors addObject:[[MSColor alloc] initWithTopColor:@"E4B7F0" bottomColor:@"E4B7F0" foregroundColor:@"333333"]];

//        [colors addObject:[[MSColor alloc] initWithTopColor:@"D1EEFC" bottomColor:@"D1EEFC" foregroundColor:@"333333"]];
//        [colors addObject:[[MSColor alloc] initWithTopColor:@"E0F8D8" bottomColor:@"E0F8D8" foregroundColor:@"333333"]];
        [colors addObject:[[MSColor alloc] initWithTopColor:@"FB2B69" bottomColor:@"FB2B69" foregroundColor:@"333333"]];
        [colors addObject:[[MSColor alloc] initWithTopColor:@"FF5B37" bottomColor:@"FF5B37" foregroundColor:@"333333"]];

//        [colors addObject:[[MSColor alloc] initWithTopColor:@"F7F7F7" bottomColor:@"D7D7D7" foregroundColor:@"333333"]];
        [colors addObject:[[MSColor alloc] initWithTopColor:@"1D77EF" bottomColor:@"1D77EF" foregroundColor:@"333333"]];
        [colors addObject:[[MSColor alloc] initWithTopColor:@"34AADC" bottomColor:@"34AADC" foregroundColor:@"333333"]];

//        [colors addObject:[[MSColor alloc] initWithTopColor:@"D6CEC3" bottomColor:@"E4DDCA" foregroundColor:@"333333"]];
//        [colors addObject:[[MSColor alloc] initWithTopColor:@"55EFCB" bottomColor:@"55EFCB" foregroundColor:@"333333"]];
        [colors addObject:[[MSColor alloc] initWithTopColor:@"5BCAFF" bottomColor:@"5BCAFF" foregroundColor:@"333333"]];

        [colors addObject:[[MSColor alloc] initWithTopColor:@"FF4981" bottomColor:@"FF4981" foregroundColor:@"333333"]];

        //        [colors addObject:[[MSColor alloc] initWithTopColor:@"FFD3E0" bottomColor:@"FFD3E0" foregroundColor:@"333333"]];
//        [colors addObject:[[MSColor alloc] initWithTopColor:@"F7F7F7" bottomColor:@"F7F7F7" foregroundColor:@"333333"]];
//        [colors addObject:[[MSColor alloc] initWithTopColor:@"FF1300" bottomColor:@"FF1300" foregroundColor:@"FFFFFF"]];
//        [colors addObject:[[MSColor alloc] initWithTopColor:@"FF3A2D" bottomColor:@"FF3A2D" foregroundColor:@"FFFFFF"]];
//        [colors addObject:[[MSColor alloc] initWithTopColor:@"BDBEC2" bottomColor:@"BDBEC2" foregroundColor:@"333333"]];
        self.colors = [NSArray arrayWithArray:colors];
    }
    
    return self;
}

@end
