//
//  ViewController.m
//  Twitterizer
//
//  Created by Rafael Auriemo on 1/13/16.
//  Copyright © 2016 Rafael Auriemo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UILabel *charLenLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.textView.delegate = self; // set UITextView delegate as current VC
    self.charLenLabel.text = [NSString stringWithFormat:@"%lu", self.textView.text.length];
}

#pragma mark LOGIC
- (IBAction)twitterizeButton:(UIButton *)sender {
    NSString *inputString = self.textView.text;
    NSCharacterSet *vowelCharSet = [NSCharacterSet characterSetWithCharactersInString:@"aeiouAEIOU"];
    
    NSMutableString *mutableString = [NSMutableString new];
    for (int i = 0; i < inputString.length; i++) {
        char charAtIndex = [inputString characterAtIndex:i];
        if (![vowelCharSet characterIsMember:charAtIndex]) {
            [mutableString appendString:[NSString stringWithFormat:@"%c", charAtIndex]];
        }
    }
    
    self.textView.text =mutableString; 
}

#pragma mark DELEGATE METHODS
- (void)textViewDidChangeSelection:(UITextView *)textView{
    self.charLenLabel.text = [NSString stringWithFormat:@"%lu", self.textView.text.length];
}

- (void)textViewDidEndEditing:(UITextView *)textView {
    
}

- (void)textViewDidChange:(UITextView *)textView {
    
}


@end
