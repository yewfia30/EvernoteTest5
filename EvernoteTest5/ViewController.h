//
//  ViewController.h
//  EvernoteTest5
//
//  Created by yoshinobu on 2016/04/10.
//  Copyright © 2016年 testorg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ENSDK/ENSDK.h>

@interface ViewController : UIViewController

- (IBAction)loginButton:(id)sender;
- (IBAction)getNotebookButton:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *notebookLabel;
- (IBAction)uploadNoteButton:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *noteTitleTextField;

@property ENNotebook * targetNotebook;

@end

