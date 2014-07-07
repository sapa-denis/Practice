//
//  SCLPersonListTableViewController.h
//  SecondLecture
//
//  Created by Sapa Denys on 03.07.14.
//  Copyright (c) 2014 Sapa Denys. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCLAppDelegate.h"

@interface SCLPersonListTableViewController : UITableViewController

@property (nonatomic, strong) id <SCLDataProvider> dataProvider;

@end
