//
//  MyTableViewController.m
//  EmptyApp
//
//  Created by cat on 12/19/15.
//  Copyright (c) 2015 myxcode. All rights reserved.
//

#import "MyTableViewController.h"
#import "AppDelegate.h"

@interface MyTableViewController ()
@end

@implementation MyTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell432";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewStylePlain reuseIdentifier:CellIdentifier];
    }
    if([indexPath section] == 0 && [indexPath row] == 0){
        cell.textLabel.text = @"Section 0 Row 0";
    }else if([indexPath section] == 0 && [indexPath row] == 1){
        cell.textLabel.text = @"Section 1Row 1";
    }
    return cell;
}
@end
