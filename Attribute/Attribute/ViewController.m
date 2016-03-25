//
//  ViewController.m
//  Attribute
//
//  Created by hengjie chen on 10/2/2016.
//  Copyright © 2016 hengjie chen. All rights reserved.
//

#import "ViewController.h"
#import "TextStatsViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *body;
@property (weak, nonatomic) IBOutlet UILabel *headline;
@property (weak, nonatomic) IBOutlet UIButton *outlineButton;

@end


@implementation ViewController

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"Analyze Test"]){
        if ([segue.destinationViewController isKindOfClass:[TextStatsViewController class]]) {
            TextStatsViewController *tsvc = (TextStatsViewController *) segue.destinationViewController;
            tsvc.textForAnalyze = self.body.textStorage;
        }
    }
//    segue.destinationViewController.hidesBottomBarWhenPushed = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc] initWithString:self.outlineButton.currentTitle];
    [title setAttributes:@{ NSStrokeWidthAttributeName : @3,
                            NSStrokeColorAttributeName : self.outlineButton.tintColor }
                   range:NSMakeRange(0, [title length])];
    [self.outlineButton setAttributedTitle:title forState:UIControlStateNormal];
}

- (void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self usePerferredFonts];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(preferredFontsChanged:)
                                                 name:UIContentSizeCategoryDidChangeNotification
                                               object:nil];
}

- (void) viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIContentSizeCategoryDidChangeNotification
                                                  object:nil];
}

- (void) preferredFontsChanged:(NSNotification *)notification{
    [self usePerferredFonts];
}

- (void) usePerferredFonts {
    self.body.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    self.headline.font = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
}

- (IBAction)changeBodySelectionColorToMatchBackgroundOfButton:(UIButton *)sender {
    NSLog(@"Change selected text color to %@", sender.backgroundColor);
    [self.body.textStorage addAttribute:NSForegroundColorAttributeName
                                  value:sender.backgroundColor
                                  range:self.body.selectedRange];
}
- (IBAction)outlineBodySelection {
    [self.body.textStorage addAttributes:@{ NSStrokeWidthAttributeName : @-3,
                                            NSStrokeColorAttributeName : [UIColor blackColor] }
                                   range:self.body.selectedRange];
}
- (IBAction)unoutlineBodySelection {
    [self.body.textStorage removeAttribute:NSStrokeWidthAttributeName
                                     range:self.body.selectedRange];
}



@end
