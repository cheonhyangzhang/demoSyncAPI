//
//  ViewController.h
//  demoSnycAPI
//
//  Created by cheonhyang on 13-5-15.
//  Copyright (c) 2013年 Tianxiang Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <dropbox/dropbox.h>

@interface ViewController : UIViewController
- (IBAction)linkDropbox:(id)sender;
- (IBAction)setFileSystem:(id)sender;
- (IBAction)uploadFile:(id)sender;
- (IBAction)readFile:(id)sender;

@end
