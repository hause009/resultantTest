//
//  MessageController.m
//  resultantTest
//
//  Created by Alex on 20.01.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "MessageController.h"

@interface MessageController ()
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;

@end

@implementation MessageController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(IBAction)back:(id)sender {
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
