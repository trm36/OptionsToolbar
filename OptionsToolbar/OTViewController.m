//
//  OTViewController.m
//  OptionsToolbar
//
//  Created by Joshua Howland on 6/5/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "OTViewController.h"
#import <MessageUI/MessageUI.h>

@interface OTViewController () <MFMailComposeViewControllerDelegate>

@end

@implementation OTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)mailButtonPressed:(UIBarButtonItem *)sender
{
    MFMailComposeViewController *mailViewController = [[MFMailComposeViewController alloc]init];
    
    mailViewController.mailComposeDelegate = self;
    
    [mailViewController setSubject:@"my subject"];
    [mailViewController setMessageBody:@"<strong>message</strong> <em>body</em>" isHTML:YES];
    
    [self presentViewController:mailViewController animated:NO completion:nil];
}

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    [controller dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)redButtonPressed:(UIBarButtonItem *)sender
{
    self.view.backgroundColor = [UIColor redColor];
}

- (IBAction)blueButtonPressed:(UIBarButtonItem *)sender
{
    self.view.backgroundColor = [UIColor blueColor];
}

- (IBAction)newButtonPressed:(UIBarButtonItem *)sender
{
    UIViewController *customViewController = [UIViewController new];
    
    customViewController.view.backgroundColor = [UIColor blackColor];
    
    UIButton *customVCButton = [[UIButton alloc] initWithFrame:CGRectMake(0, (customViewController.view.frame.size.height - 20)/2, customViewController.view.frame.size.width, 20)];
    [customVCButton setTitle:@"HAPPY BIRTHDAY REN!" forState:UIControlStateNormal];
    //[customVCButton setTintColor:[UIColor redColor]];
    [customVCButton addTarget:self action:@selector(dismissCustomView) forControlEvents:UIControlEventTouchUpInside];
    
    [customViewController.view addSubview:customVCButton];
    
    [self presentViewController:customViewController animated:YES completion:nil];
}

- (void)dismissCustomView
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
