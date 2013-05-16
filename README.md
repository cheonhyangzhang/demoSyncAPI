demoSyncAPI
===========

Demo ios app for Dropbox API    syncAPI

This app shows the use of Dropbox Sync API

1 Sign up as Dropbox developer.
2 Create new app in the app console
  Name could not start with drop
3 Drag in the SDK framework
4 Add more framework    CFNetwork Security  SystemConfiguration QuartzCore
5 import <dropbox.....h> in every file you want to use DB method
6 In AppDelegate.m    fill the didFinishLaunch.... with the code in tutorial
   DBAccountManager* accountMgr =
        [[DBAccountManager alloc] initWithAppKey:@"APP_KEY" secret:@"APP_SECRET"];
    [DBAccountManager setSharedManager:accountMgr];
  
   Fill the APP_KEY and APP_SECRET
7 In demoSnycAPI-Info.plist
   Add after <dict>
   <key>CFBundleURLTypes</key>
    <array>
    <dict>
        <key>CFBundleURLSchemes</key>
        <array>
            <string>db-APP_KEY</string>
        </array>
    </dict>
   </array>
   
8 Fill the method called when you clicked the linkDropbox button
   [[DBAccountManager sharedManager] linkFromController:YOUR_ROOT_CONTROLLER];
   change the argument to
    self
    at the end
9 Add delegate method in AppDelegate.m
  - (BOOL)application:(UIApplication *)app openURL:(NSURL *)url
sourceApplication:(NSString *)source annotation:(id)annotation {
    DBAccount *account = [[DBAccountManager sharedManager] handleOpenURL:url];
    if (account) {
        NSLog(@"App linked successfully!");
        return YES;
    }
}

10 set Filesystem
  DBAccountManager *accountMgr = [DBAccountManager sharedManager];
  DBAccount *account = accountMgr.linkedAccount;

  if (account) {
    DBFilesystem *filesystem = [[DBFilesystem alloc] initWithAccount:account];
    [DBFilesystem setSharedFilesystem:filesystem];
  }

11 Working with files
     in uploadFile 
      DBPath *newPath = [[DBPath root] childPath:@"hello.txt"];
      DBFile *file = [[DBFilesystem sharedFilesystem] createFile:newPath error:nil];
      [file writeString:@"Hello World!" error:nil];
    in readFile
      DBPath *existingPath = [[DBPath root] childPath:@"hello.txt"];
      DBFile *file = [[DBFilesystem sharedFilesystem] open:existingPath error:nil];
      NSString *contents = [file readString:nil];
      NSLog(@"%@", contents);


Feel free to contact me if you have any questions.

cenhiangapply@gmail.com
