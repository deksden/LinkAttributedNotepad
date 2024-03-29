//
//  DxViewController.m
//  linkAtt
//
//  Created by Денис Киселев on 11.09.14.
//  Copyright (c) 2014 deksden. All rights reserved.
//

#import "DxViewController.h"

@interface DxViewController ()


@end

@implementation DxViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:@"This is an example by @deksden. \nOrdinar links like http://www.raywenderlich.com/tutorials highlighted automatically and when clicked they opens in Safari"];
    NSRange range = [[attributedString string] rangeOfString:@"@deksden"];
    [attributedString addAttribute:NSLinkAttributeName
                             value:@"username://deksden"
                             range: range];
    
     
     NSDictionary *linkAttributes = @{NSForegroundColorAttributeName: [UIColor colorWithRed:0.0 green:122.0/255.0 blue:1.0 alpha:1.0], //[UIColor greenColor],
                                      NSUnderlineColorAttributeName: [UIColor lightGrayColor],
                                      NSUnderlineStyleAttributeName: @(NSUnderlinePatternSolid)};
     
     // assume that textView is a UITextView previously created (either by code or Interface Builder)
     self.textView.linkTextAttributes = linkAttributes; // customizes the appearance of links
     self.textView.attributedText = attributedString;
     self.textView.delegate = self;
    
}

- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange {
    if ([[URL scheme] isEqualToString:@"username"]) {
        NSString *username = [URL host];
        // do something with this username
        // ...
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Link clicked"
                                                        message:username
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        return NO;
    }
    return YES; // let the system open this URL
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
