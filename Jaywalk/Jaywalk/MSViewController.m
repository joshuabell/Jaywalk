//
//  ViewController.m
//  Jaywalk
//
//  Created by Mac on 10/31/17.
//  Copyright © 2017 WowCow. All rights reserved.
//

#import "MSViewController.h"
#import "MSColor.h"
#import "MSIOSColorData.h"
#import <Social/Social.h>
#import <pop/POP.h>

#define NUM_YOLOS @"numYolos"

@interface MSViewController ()
@property (nonatomic) MSColor *curColorScheme;
@property (nonatomic) MSIOSColorData *colorData;
@property (weak, nonatomic) IBOutlet UIButton *yoloButton;
@property (weak, nonatomic) IBOutlet UILabel *jaywalkInfoText;
@property (nonatomic) CAGradientLayer *curGradient;
@property (weak, nonatomic) IBOutlet UIButton *shareButton;
@property (assign, nonatomic) NSUInteger colorCounter;
@property  (nonatomic) NSNumberFormatter *formatter;
- (IBAction)yoloButtonDidTap:(id)sender;

@end

@implementation MSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.formatter = [NSNumberFormatter new];
    [self.formatter setNumberStyle:NSNumberFormatterDecimalStyle]; // this line is important!
    self.colorData = [[MSIOSColorData alloc] init];
    self.curGradient = [CAGradientLayer layer];
    self.curGradient.frame = self.view.bounds;
    self.shareButton.alpha = .4;
    
    self.curColorScheme = self.colorData.colors[0];
    [self.yoloButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.jaywalkInfoText setTextColor:[UIColor whiteColor]];
    self.colorCounter = 0;
    NSInteger numYolos = [[NSUserDefaults standardUserDefaults] integerForKey:NUM_YOLOS];
    [[NSUserDefaults standardUserDefaults] setInteger:numYolos forKey:NUM_YOLOS];
    self.jaywalkInfoText.text = [self displayMessageWithNumYolos:numYolos];
    
    self.curColorScheme = self.colorData.colors[arc4random_uniform((u_int32_t)[self.colorData.colors count])];
    [self.view setBackgroundColor:self.curColorScheme.topColor];
    
}

- (IBAction)shareButtonDidTap:(id)sender
{
    NSString *shareText = [self.jaywalkInfoText.text stringByAppendingString:@" #YOLO #Jaywalk https://github.com/joshuabell/Jaywalk"];
    UIActivityViewController *activityViewController = [[UIActivityViewController alloc] initWithActivityItems:@[shareText] applicationActivities:nil];
    [self presentViewController:activityViewController animated:YES completion:nil];
}

-(void)switchColorScheme
{
    self.curColorScheme = self.colorData.colors[arc4random_uniform((u_int32_t)[self.colorData.colors count])];
    self.colorCounter = self.colorCounter + 1;
    [self.view setBackgroundColor:self.curColorScheme.topColor];
}


- (IBAction)yoloButtonDidTap:(id)sender
{
    
    POPSpringAnimation *sprintAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewScaleXY];
    sprintAnimation.delegate = self;
    sprintAnimation.removedOnCompletion = YES;
    sprintAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(1, 1)];
    sprintAnimation.springBounciness = 30.f;
    sprintAnimation.velocity = [NSValue valueWithCGPoint:CGPointMake(7, 7)];
    NSString *animationKey = [NSString stringWithFormat:@"springAniamtion%lu", (unsigned long)self.colorCounter];
    [self.yoloButton pop_addAnimation:sprintAnimation forKey:animationKey];
    
    [self switchColorScheme];
    
    NSInteger numYolos = [[NSUserDefaults standardUserDefaults] integerForKey:NUM_YOLOS];
    numYolos++;
    [[NSUserDefaults standardUserDefaults] setInteger:numYolos forKey:NUM_YOLOS];
    self.jaywalkInfoText.text = [self displayMessageWithNumYolos:numYolos];
}

- (NSString *)displayMessageWithNumYolos:(NSInteger)numYolos {
    NSString *fine = [self.formatter stringFromNumber:@(numYolos * 191)];
    NSString *numYolosString = [self.formatter stringFromNumber:@(numYolos)];
    return [NSString stringWithFormat:@"I jaywalked %@ times.\nThe fine for all those\njaywalks is $%@.", numYolosString, fine];
}


@end

