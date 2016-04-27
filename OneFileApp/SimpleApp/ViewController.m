#import "ViewController.h"
#import "QuartzCore/QuartzCore.h"

@interface ViewController()
@end

@implementation ViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    UIButton* mybut = [UIButton buttonWithType:UIButtonTypeSystem];
    CGRect frame = CGRectMake(100, 250, 140, 50);
    mybut.frame = frame;

    [mybut addTarget:self action:@selector(clickMe:) forControlEvents:UIControlEventTouchUpInside];
    [mybut setBackgroundImage:[[UIImage imageNamed:@"pic.png"] stretchableImageWithLeftCapWidth:0.0 topCapHeight:0.0] forState:UIControlStateNormal];
    [mybut setTitle:@"mybut" forState:(UIControlState) UIControlStateNormal];
    self.view.backgroundColor = [UIColor grayColor];
    [self.view addSubview:mybut];
    
    [self FileOperation];
    
}

-(void)FileOperation{
    NSFileManager* fileManager = [[NSFileManager alloc]init];
    NSString* path = @"/dog/cat";
    NSString* name = @"file.txt";
    
    NSString* fullPath = [path stringByAppendingPathComponent:name];
    
    NSString* str1 = @"str1";
    NSString* str2 = @"str2";
    NSString* catStr = [str1 stringByAppendingString:str2];
 
    NSArray* docPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString* documentDirectory = [docPath objectAtIndex:0];
    NSLog(@"documentDirectory=%@", documentDirectory);
    
    NSArray* cashesDirArr = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString* cashesDir = [cashesDirArr objectAtIndex:0];
    NSLog(@"cashesDir=%@", cashesDir);

    NSArray* downloadDirArr = NSSearchPathForDirectoriesInDomains(NSDownloadsDirectory, NSUserDomainMask, YES);
    NSString* downloadDir = [downloadDirArr objectAtIndex:0];
    NSLog(@"downloadDir=%@", downloadDir);

    NSString* deleteComponent = [@"/dog/cat/cow" stringByDeletingLastPathComponent];
    NSLog(@"deleteComponent[%@]", deleteComponent);

    NSString* lastComponent = [@"/dog/cat/cow" lastPathComponent];
    NSLog(@"lastComponent[%@]", lastComponent);

    NSString* noExtPath = [@"/dog/cat/cow.txt" stringByDeletingPathExtension];
    NSLog(@"noExtPath[%@]", noExtPath);

    // create file from NSString
    NSError* error;
    NSString* strData = @"Convert String to NSData";
    NSData* dataBuffer = [strData dataUsingEncoding:NSUTF8StringEncoding];
    NSString* filePath = [documentDirectory stringByAppendingPathComponent:@"myfile.txt"];
    //[fileManager copyItemAtPath:screenShotImageFile toPath:fullPath error:&error];
    [dataBuffer writeToFile:filePath atomically:YES];
    NSLog(@"filePath[%@]", filePath);

    // copy file
    NSString* newFilePath = [documentDirectory stringByAppendingPathComponent:@"newfile.txt"];
    [fileManager copyItemAtPath:filePath toPath:newFilePath error:&error];
    NSLog(@"newFilePath[%@]", filePath);

    // create empty file
    NSString* emptyFilePath = [documentDirectory stringByAppendingPathComponent:@"emptyfile.txt"];
    [fileManager createFileAtPath:emptyFilePath contents:nil attributes:nil];
    NSLog(@"emptyFilePath[%@]", emptyFilePath);

    // write to file
    NSString* myString = @"write to file";
    NSString* myEmptyFile = [documentDirectory stringByAppendingPathComponent:@"myempty.txt"];
    [fileManager createFileAtPath:emptyFilePath contents:nil attributes:nil];
    [myString writeToFile:myEmptyFile atomically:YES encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"myEmptyFile[%@]", myEmptyFile);

    // read NSString from file
    NSString *contents = [NSString stringWithContentsOfFile:myEmptyFile];
    NSLog(@"contents=[%@]", contents);

    // read NSData from file
    NSData* dataContents = [NSData dataWithContentsOfFile:myEmptyFile];
    NSString* myStr1 = [[NSString alloc] initWithData:dataContents encoding:NSUTF8StringEncoding];
    NSLog(@"myStr1=[%@]", myStr1);
    
//        NSApplicationDirectory = 1,             // supported applications (Applications)
//        NSDemoApplicationDirectory,             // unsupported applications, demonstration versions (Demos)
//        NSDeveloperApplicationDirectory,        // developer applications (Developer/Applications). DEPRECATED - there is no one single Developer directory.
//        NSAdminApplicationDirectory,            // system and network administration applications (Administration)
//        NSLibraryDirectory,                     // various documentation, support, and configuration files, resources (Library)
//        NSDeveloperDirectory,                   // developer resources (Developer) DEPRECATED - there is no one single Developer directory.
//        NSUserDirectory,                        // user home directories (Users)
//        NSDocumentationDirectory,               // documentation (Documentation)
//        NSDocumentDirectory,                    // documents (Documents)
//        NSCoreServiceDirectory,                 // location of CoreServices directory (System/Library/CoreServices)
//        NSAutosavedInformationDirectory NS_ENUM_AVAILABLE(10_6, 4_0) = 11,   // location of autosaved documents (Documents/Autosaved)
//        NSDesktopDirectory = 12,                // location of user's desktop
//        NSCachesDirectory = 13,                 // location of discardable cache files (Library/Caches)
//        NSApplicationSupportDirectory = 14,     // location of application support files (plug-ins, etc) (Library/Application Support)
//        NSDownloadsDirectory NS_ENUM_AVAILABLE(10_5, 2_0) = 15,              // location of the user's "Downloads" directory
//        NSInputMethodsDirectory NS_ENUM_AVAILABLE(10_6, 4_0) = 16,           // input methods (Library/Input Methods)
//        NSMoviesDirectory NS_ENUM_AVAILABLE(10_6, 4_0) = 17,                 // location of user's Movies directory (~/Movies)
//        NSMusicDirectory NS_ENUM_AVAILABLE(10_6, 4_0) = 18,                  // location of user's Music directory (~/Music)
//        NSPicturesDirectory NS_ENUM_AVAILABLE(10_6, 4_0) = 19,               // location of user's Pictures directory (~/Pictures)
//        NSPrinterDescriptionDirectory NS_ENUM_AVAILABLE(10_6, 4_0) = 20,     // location of system's PPDs directory (Library/Printers/PPDs)
//        NSSharedPublicDirectory NS_ENUM_AVAILABLE(10_6, 4_0) = 21,           // location of user's Public sharing directory (~/Public)
//        NSPreferencePanesDirectory NS_ENUM_AVAILABLE(10_6, 4_0) = 22,        // location of the PreferencePanes directory for use with System Preferences (Library/PreferencePanes)
//        NSApplicationScriptsDirectory NS_ENUM_AVAILABLE(10_8, NA) = 23,      // location of the user scripts folder for the calling application (~/Library/Application Scripts/code-signing-id)
//        NSItemReplacementDirectory NS_ENUM_AVAILABLE(10_6, 4_0) = 99,	    // For use with NSFileManager's URLForDirectory:inDomain:appropriateForURL:create:error:
//        NSAllApplicationsDirectory = 100,       // all directories where applications can occur
//        NSAllLibrariesDirectory = 101,          // all directories where resources can occur
//        NSTrashDirectory NS_ENUM_AVAILABLE(10_8, NA) = 102                   // location of Trash directory
//        
//    typedef NS_OPTIONS(NSUInteger, NSSearchPathDomainMask) {
//        NSUserDomainMask = 1,       // user's home directory --- place to install user's personal items (~)
//        NSLocalDomainMask = 2,      // local to the current machine --- place to install items available to everyone on this machine (/Library)
//        NSNetworkDomainMask = 4,    // publically available location in the local area network --- place to install items available on the network (/Network)
//        NSSystemDomainMask = 8,     // provided by Apple, unmodifiable (/System)
//        NSAllDomainsMask = 0x0ffff  // all domains: all of the above and future items
//    };
}


-(void) clickMe:(id) sender{
    NSLog(@"click me");
}
@end
