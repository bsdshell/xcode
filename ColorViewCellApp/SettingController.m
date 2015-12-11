#import "SettingController.h"
#import "MyLib.h"


@interface SettingController ()

@end

@implementation SettingController


- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    self.navigationController.navigationBar.tintColor = nil;
    self.navigationController.navigationBar.translucent = YES;
    _colorIndex = 0;
    _array = [MyLib allXColor];
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_array count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    tableView.separatorColor = [UIColor clearColor];
    CGSize size = [UIScreen mainScreen].bounds.size;
    CGFloat margin = 10;
    CGRect frame = CGRectMake(margin, margin, size.width-2*margin, 40);

    UILabel* label = [[UILabel alloc] initWithFrame:frame];
    [label setTextColor:[UIColor brownColor]];
    [label setBackgroundColor:[UIColor brownColor]];
    [label setFont:[UIFont fontWithName: @"Trebuchet MS" size: 20.0f]];
    [label setTextAlignment:NSTextAlignmentCenter];
    
    XColor* xcolor = _array[[indexPath row]];
    label.backgroundColor = xcolor.color;
    NSString* strFormat = [NSString stringWithFormat:@"[%.01f][%.01f][%.01f][%.01f]", xcolor.red, xcolor.green, xcolor.blue, xcolor.alpha];
    label.text = strFormat;
    UITableViewCell* cell = [[UITableViewCell alloc] init];
    
    
    //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    [cell addSubview:label];
    return cell;
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    if([indexPath section] == 0 && [indexPath row] == 0)
    {
    }
    else if([indexPath section] == 0 && [indexPath row] == 1)
    {
    }
}

@end
