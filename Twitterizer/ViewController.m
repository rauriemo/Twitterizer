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



- (IBAction)hashtaggerButton:(id)sender {
    
    
    NSString *input = self.textView.text;
    NSMutableArray *wordArray = [input componentsSeparatedByString:@" "];
    
    
    for (int i = 0; i < wordArray.count; i++) {
        if (i % 2 == 0 && ![[[wordArray objectAtIndex:i]  substringToIndex: 1] isEqualToString: @"#"]) {
            [wordArray replaceObjectAtIndex:i withObject:[NSString stringWithFormat:@"#%@", wordArray[i]]];
            
        }
    }
    
    
    NSString *output = [wordArray componentsJoinedByString:@" "];
    self.textView.text = output;
    
}

- (IBAction)reverseButton:(id)sender {
    
    NSString *input = self.textView.text;
    NSMutableArray *wordArray = [input componentsSeparatedByString:@" "];
    NSString *currentWord = [NSString new];
    
    
    for (int i = 0; i < wordArray.count; i++) {
        if (i % 2 != 0) {
            NSMutableString *changedWord = [NSMutableString new];
            currentWord = wordArray[i];
            for (int x = currentWord.length; x>0; x-- ) {
                [changedWord appendString:[NSString stringWithFormat:@"%c", [currentWord characterAtIndex:x-1]]];
            }
            [wordArray replaceObjectAtIndex:i withObject:changedWord];
        }
    }

    NSString *output = [wordArray componentsJoinedByString:@" "];
    self.textView.text = output;

    
}



#pragma mark DELEGATE METHODS
- (void)textViewDidChangeSelection:(UITextView *)textView{
    
    
  
    NSString *text = self.textView.text;
        NSRange limit = {0, 140};
    
    if (self.textView.text.length > 140) {
       
        
        self.textView.text = [text substringWithRange: limit];
        
        
        
        [UIView animateWithDuration:0.1 animations:^{
            self.view.backgroundColor =  [UIColor redColor];
        }];
        
        [UIView animateWithDuration:0.1 animations:^{
            self.view.backgroundColor =  [UIColor whiteColor];
        }];
        
    }
//    else if (self.textView.text.length < 140) {
//        self.view.backgroundColor = [UIColor whiteColor];
//    }
    self.charLenLabel.text = [NSString stringWithFormat:@"%lu", self.textView.text.length];
}





@end
