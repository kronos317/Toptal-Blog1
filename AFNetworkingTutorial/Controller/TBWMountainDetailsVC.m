//
//  TBWMountainDetailsVC.m
//  AFNetworkingTutorial
//
//  Created by Wuqian on 1/25/17.
//  Copyright © 2017 Blog. All rights reserved.
//

#import "TBWMountainDetailsVC.h"
#import "TBWMountainManager.h"
#import "TBWMountainDataModel.h"
#import "TBWUtilsImage.h"

@interface TBWMountainDetailsVC ()

@property (weak, nonatomic) IBOutlet UIImageView *imagePhoto;
@property (weak, nonatomic) IBOutlet UILabel *labelDetails;

@end

@implementation TBWMountainDetailsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self refreshViews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) refreshViews{
    TBWMountainDataModel *mountain = [[TBWMountainManager sharedInstance].mountainList objectAtIndex:self.index];
    self.labelDetails.text = mountain.desc;
    [TBWUtilsImage setImageView:self.imagePhoto WithUrl:[NSURL URLWithString:mountain.image] Placeholder:[UIImage imageNamed:@"mountain-placeholder"] EnableCache:YES];
    self.title = mountain.name;
}

@end
