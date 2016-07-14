//
//  ViewController.h
//  Currency Converter
//
//  Created by Aislin Philomena Black on 7/12/16.
//  Copyright © 2016 Aislin Philomena Black. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Currency.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIPickerView *homePicker;
@property (weak, nonatomic) IBOutlet UIPickerView *foreignPicker;
@property (weak, nonatomic) IBOutlet UITextField *homeField;
@property (weak, nonatomic) IBOutlet UITextField *foreignField;
- (IBAction)switchButton:(id)sender;
- (IBAction)refreshButton:(id)sender;

@property (strong, nonatomic) NSMutableArray* moneys;

@end

