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
    //    [self.view.layer addSublayer:self.curGradient];
    //    [self.view.layer insertSublayer:self.curGradient atIndex:0];
    
    // set default foregroundcolors
    self.curColorScheme = self.colorData.colors[0];
    //    [self.yoloButton setTitleColor:self.curColorScheme.foregroundGolor forState:UIControlStateNormal];
    //    [self.jaywalkInfoText setTextColor:self.curColorScheme.foregroundGolor];
    [self.yoloButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.jaywalkInfoText setTextColor:[UIColor whiteColor]];
    self.colorCounter = 0;
    NSInteger numYolos = [[NSUserDefaults standardUserDefaults] integerForKey:NUM_YOLOS];
    [[NSUserDefaults standardUserDefaults] setInteger:numYolos forKey:NUM_YOLOS];
    self.jaywalkInfoText.text = [self displayMessageWithNumYolos:numYolos];
    [self setNeedsStatusBarAppearanceUpdate];
    
    if (![SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]) {
        self.shareButton.alpha = 0;
    }
    
    
    self.curColorScheme = self.colorData.colors[arc4random_uniform((u_int32_t)[self.colorData.colors count])];
    [self.view setBackgroundColor:self.curColorScheme.topColor];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    
}

-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    //    [self switchColorScheme];
    
    //    self.curGradient.frame = self.view.bounds;
    
}
- (IBAction)shareButtonDidTap:(id)sender
{
    
    //    SLComposeViewController *tweetController = [SLComposeViewController
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]) {
        
        SLComposeViewController *mySLComposerSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
        
        NSString *initialText = [NSString stringWithFormat:@"%@ #YOLO #iJaywalk", self.jaywalkInfoText.text];
        [mySLComposerSheet setInitialText:initialText];
        
        [mySLComposerSheet setCompletionHandler:^(SLComposeViewControllerResult result) {
            switch (result) {
                case SLComposeViewControllerResultCancelled:
                    NSLog(@"Post Canceled");
                    break;
                case SLComposeViewControllerResultDone:
                    NSLog(@"Post Sucessful");
                    break;
                    
                default:
                    break;
            }
        }];
        
        [self presentViewController:mySLComposerSheet animated:YES completion:nil];
    }
}

-(void)switchColorScheme
{
    // just change the colors of the gradient don't add a whole new greadient obejct
    self.curColorScheme = self.colorData.colors[arc4random_uniform((u_int32_t)[self.colorData.colors count])];
    //    self.curColorScheme = self.colorData.colors[ self.colorCounter ];
    self.colorCounter = self.colorCounter + 1;
    //    self.curGradient.colors = [NSArray arrayWithObjects:(id)[self.curColorScheme.topColor CGColor], (id)[self.curColorScheme.bottomColor CGColor], nil];
    //    [UIView beginAnimations:@"colorchange" context:nil];
    //    [UIView setAnimationDelay:0.1];
    //    [UIView setAnimationDuration:0.4];
    //    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    
    [self.view setBackgroundColor:self.curColorScheme.topColor];
    //    [UIView commitAnimations];
    //    NSLog( @"topColor -> %@", self.curColorScheme.topHexString );
    //    if ( [[self.view.layer sublayers] count] > 0 )
    //    {
    //        CALayer *layerToRemove = self.view.layer.sublayers[0];
    //        [layerToRemove removeFromSuperlayer];
    //    }
    
    //    [self.yoloButton setTitleColor:self.curColorScheme.foregroundGolor forState:UIControlStateNormal];
    //    [self.view bringSubviewToFront:self.yoloButton];
    //    [self.jaywalkInfoText setTextColor:self.curColorScheme.foregroundGolor];
    //    [self.view bringSubviewToFront:self.jaywalkInfoText];
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
    //    NSString *animationKey = [NSString stringWithFormat:@"springAniamtion"];
    [self.yoloButton pop_addAnimation:sprintAnimation forKey:animationKey];
    
    
    [self switchColorScheme];
    
    
    NSInteger numYolos = [[NSUserDefaults standardUserDefaults] integerForKey:NUM_YOLOS];
    numYolos++;
    [[NSUserDefaults standardUserDefaults] setInteger:numYolos forKey:NUM_YOLOS];
    self.jaywalkInfoText.text = [self displayMessageWithNumYolos:numYolos];
}

- (NSString *)displayMessageWithNumYolos:(NSInteger)numYolos {
    
    //    numYolos = 10000;
    NSString *fine = [self.formatter stringFromNumber:@(numYolos * 191)];
    NSString *numYolosString = [self.formatter stringFromNumber:@(numYolos)];
    return [NSString stringWithFormat:@"I jaywalked %@ times.\nThe fine for all those\njaywalks is $%@.", numYolosString, fine];
    //    return [NSString stringWithFormat:@"I goodluck yolo'd for %@ jaywalkers. The fine for all those jaywalks is $%@.", numYolosString, fine];
    
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end

