//
//  ViewController.m
//  demoSnycAPI
//
//  Created by cheonhyang on 13-5-15.
//  Copyright (c) 2013年 Tianxiang Zhang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

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

- (IBAction)linkDropbox:(id)sender {
    [[DBAccountManager sharedManager] linkFromController:self];
}

- (IBAction)setFileSystem:(id)sender {
    DBAccountManager *accountMgr = [DBAccountManager sharedManager];
    DBAccount *account = accountMgr.linkedAccount;
    
    if (account) {
        DBFilesystem *filesystem = [[DBFilesystem alloc] initWithAccount:account];
        [DBFilesystem setSharedFilesystem:filesystem];
    }
}

- (IBAction)uploadFile:(id)sender {
    DBPath *newPath = [[DBPath root] childPath:@"hello.txt"];
    DBFile *file = [[DBFilesystem sharedFilesystem] createFile:newPath error:nil];
    [file writeString:@"Hello World!" error:nil];	

}

- (IBAction)readFile:(id)sender {
    DBPath *existingPath = [[DBPath root] childPath:@"hello.txt"];
    DBFile *file = [[DBFilesystem sharedFilesystem] openFile:existingPath error:nil];
    NSString *contents = [file readString:nil];
    NSLog(@"%@", contents);
}
@end
