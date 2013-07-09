//
//  AutoHideKeyboardViewController.m
//  TestTapBackgroundToHideKeyboard
//
//  Copyright (c) 2013 Zhang Zonghui
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

#import "AutoHideKeyboardViewController.h"


@interface AutoHideKeyboardViewController () <UIGestureRecognizerDelegate, UITextFieldDelegate, UITextViewDelegate>


@end


@implementation AutoHideKeyboardViewController {
    UITextField *_activeTextField;
    UITextView *_activeTextView;
}


- (void)viewDidLoad
{
    [super viewDidLoad];

    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewBackgroundTapped:)];
    tapGestureRecognizer.delegate = self;
    [self.view addGestureRecognizer:tapGestureRecognizer];
}


#pragma mark - UITextFieldDelegate methods

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    _activeTextField = textField;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    _activeTextField = nil;
}


#pragma mark - UITextViewDelegate

- (void)textViewDidBeginEditing:(UITextView *)textView
{
    _activeTextView = textView;
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    _activeTextView = nil;
}


#pragma mark - GestureRecognizerDelegate methods

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    if ( [touch.view isKindOfClass:[UIControl class]] )
    {
        return NO;
    }
    
    return YES;
}


#pragma mark - Private methods

- (void)viewBackgroundTapped:(UITapGestureRecognizer *)tapGestureRecognizer
{
    if ( _activeTextField )
    {
        [_activeTextField resignFirstResponder];
    }
    
    if ( _activeTextView )
    {
        [_activeTextView resignFirstResponder];
    }
}

@end
