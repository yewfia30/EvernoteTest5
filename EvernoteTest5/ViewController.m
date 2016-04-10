//
//  ViewController.m
//  EvernoteTest5
//
//  Created by yoshinobu on 2016/04/10.
//  Copyright © 2016年 testorg. All rights reserved.
//

#import "ViewController.h"
#import <ENSDK/ENSDK.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginButton:(id)sender {
    ENSession *session = [ENSession sharedSession];
    [session authenticateWithViewController:self preferRegistration:NO completion:^(NSError *error) {
        if (error) {
            NSLog(@"認証失敗");
        } else {
            NSLog(@"認証成功");
        }
    }];
}

- (IBAction)getNotebookButton:(id)sender {
    [[ENSession sharedSession] listNotebooksWithCompletion:^(NSArray *notebooks, NSError *listNotebooksError) {
        for (ENNotebook *notebook in notebooks) {
            if ([notebook.name isEqualToString:@"2016年"]) {
                NSLog(@"ノートブック発見");
                _targetNotebook = notebook;
                _notebookLabel.text = _targetNotebook.name;
            }
        }
    }];
}

- (IBAction)uploadNoteButton:(id)sender {
    ENNote * note = [[ENNote alloc] init];
    note.content = [ENNoteContent noteContentWithString:@"Hello, World!"];
    note.title = _noteTitleTextField.text;
    [[ENSession sharedSession] uploadNote:note notebook:_targetNotebook completion:^(ENNoteRef * noteRef, NSError * uploadNoteError) {
        if (uploadNoteError) {
            NSLog(@"ノート作成失敗");
        } else {
            NSLog(@"ノート作成成功");
        }
    }];
}
@end
