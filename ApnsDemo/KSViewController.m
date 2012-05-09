//
//  KSViewController.m
//  ApnsDemo
//
//  Created by Jinbo He on 12-5-8.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "KSViewController.h"

@interface KSViewController ()

@end

@implementation KSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

- (IBAction)doExit:(id)sender
{
    exit(0);
}

- (void)showNotify:(NSString *)body
{
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"快盘通知" 
                                                    message:body
                                                   delegate:nil
                                          cancelButtonTitle:@"关闭" 
                                          otherButtonTitles:nil];
    
    [alert show];
    [alert release];    
}


@end
