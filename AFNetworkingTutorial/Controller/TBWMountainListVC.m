//
//  TBWMountainListVC.m
//  AFNetworkingTutorial
//
//  Created by Wuqian on 1/25/17.
//  Copyright © 2017 Blog. All rights reserved.
//

#import "TBWMountainListVC.h"
#import "TBWMountainDetailsVC.h"
#import "TBWMountainManager.h"
#import "TBWMountainDataModel.h"
#import "Global.h"

@interface TBWMountainListVC () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end

@implementation TBWMountainListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableview.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(onLocalNotificationReceived:)
                                                 name:nil
                                               object:nil];
    
    [self refreshViews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
}

- (void) refreshViews{
    if ([TBWMountainManager sharedInstance].isLoading == YES){
        self.activityIndicator.hidden = NO;
        self.tableview.hidden = YES;
        [self.activityIndicator startAnimating];
    }
    else {
        self.activityIndicator.hidden = YES;
        self.tableview.hidden = NO;
        [self.activityIndicator stopAnimating];
    }
    [self.tableview reloadData];
}

- (void) gotoDetailsVCWithIndex: (int) index{
    TBWMountainDetailsVC *detailsVC = [self.storyboard instantiateViewControllerWithIdentifier:@"STORYBOARD_DETAILSVC"];
    detailsVC.index = index;
    [self.navigationController pushViewController:detailsVC animated:YES];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
}

#pragma mark - Table view data source

- (void) configureCell: (UITableViewCell *) cell AtIndex: (int) index{
    TBWMountainManager *managerMountain = [TBWMountainManager sharedInstance];
    TBWMountainDataModel *mountain = [managerMountain.mountainList objectAtIndex:index];
    
    cell.textLabel.text = mountain.name;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[TBWMountainManager sharedInstance].mountainList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TVC_MOUNTAIN_ITEM" forIndexPath:indexPath];
    
    TBWMountainManager *managerMountain = [TBWMountainManager sharedInstance];
    TBWMountainDataModel *mountain = [managerMountain.mountainList objectAtIndex:(int) indexPath.row];
    
    cell.textLabel.text = mountain.name;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    TBWMountainDetailsVC *detailsVC = [self.storyboard instantiateViewControllerWithIdentifier:@"STORYBOARD_DETAILSVC"];
    detailsVC.index = (int) indexPath.row;
    [self.navigationController pushViewController:detailsVC animated:YES];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark -NSNotification

- (void) onLocalNotificationReceived:(NSNotification *) notification{
    if (([[notification name] isEqualToString:TBWLOCALNOTIFICATION_MOUNTAIN_LIST_UPDATED]) ||
    ([[notification name] isEqualToString:TBWLOCALNOTIFICATION_MOUNTAIN_LIST_FAILED])){
        [self refreshViews];
    }
}

@end
