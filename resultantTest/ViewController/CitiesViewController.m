//
//  CitiesViewController.m
//  resultTest
//
//  Created by Anna on 21.01.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "CitiesViewController.h"
#import "UserDefaultsSettings.h"
#import "City.h"

@interface CitiesViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *cities;

@end

@implementation CitiesViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  _cities = [UserDefaultsSettings sharedSettingsManager].cities;
  // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}



#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
  return _cities.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  static NSString *reuseIndetifier = @"Cell";
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIndetifier forIndexPath:indexPath];
  City *city = _cities[indexPath.row];
  cell.textLabel.text = city.name;
  return cell;
}


/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
