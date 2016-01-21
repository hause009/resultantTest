//
//  ViewController.m
//  resultantTest
//
//  Created by Admin on 18.01.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "ViewController.h"
#import "Network.h"
#import "MessageController.h"
#import "TabBarController.h"
#import "City.h"
#import "UserDefaultsSettings.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicatorView;

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  // Do any additional setup after loading the view, typically from a nib.
}

-(IBAction)connect:(id)sender
{
  [_indicatorView startAnimating];
  [Network loadCitiesWithCompletion:^(NSArray * cities, NSError *error) {
    [_indicatorView stopAnimating];
    if (error || cities.count == 0) {
      [self openMessageController];
    } else {
      [UserDefaultsSettings sharedSettingsManager].cities = cities;
      [self openTabBarController];
    }
  }];
  
}

-(void)openMessageController {
  MessageController * controller = [self.storyboard instantiateViewControllerWithIdentifier:@"MessageController"];
  UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:controller];
  [self presentViewController:navigationController animated:YES completion:nil];
}

-(void)openTabBarController {
  TabBarController * tabBarController = [self.storyboard instantiateViewControllerWithIdentifier:@"TabBarController"];
  [self.navigationController pushViewController:tabBarController animated:nil];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
