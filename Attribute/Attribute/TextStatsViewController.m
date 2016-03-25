//
//  TextStatsViewController.m
//  Attribute
//
//  Created by Hengjie.chj on 14/2/2016.
//  Copyright © 2016 hengjie chen. All rights reserved.
//

#import "TextStatsViewController.h"

@interface TextStatsViewController ()

@property (weak, nonatomic) IBOutlet UILabel *colorfulCharactorLabel;
@property (weak, nonatomic) IBOutlet UILabel *outlineCharactorLabel;

@end

@implementation TextStatsViewController

//- (void) viewDidLoad{
//    [super viewDidLoad];
//    self.textForAnalyze = [[NSAttributedString alloc] initWithString:@"test" attributes:@{
//                                                                                         NSForegroundColorAttributeName : [UIColor redColor],
//                                                                                         NSStrokeWidthAttributeName : @-3}
//                           ];
//}

- (void) setTextForAnalyze:(NSAttributedString *)textForAnalyze{
    _textForAnalyze = textForAnalyze;
    if (self.view.window) [self updateUI];
}

- (void) viewWillAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self updateUI];
}

- (NSAttributedString *)charactorsWithAttribute:(NSString *)attributeName{
    NSMutableAttributedString *charactors = [[NSMutableAttributedString alloc] init];
    
    long index = 0;
    while (index < [self.textForAnalyze length]) {
        NSRange range;
        id value = [self.textForAnalyze attribute:attributeName atIndex:index effectiveRange:&range];
        if (value){
            [charactors appendAttributedString:[self.textForAnalyze attributedSubstringFromRange:range]];
            index = range.location + range.length;
        } else {
            index++;
        }
    }
    
    return charactors;
}

- (void) updateUI{
    self.colorfulCharactorLabel.text = [NSString stringWithFormat:@"%lu colorful charactors", (unsigned long)[[self charactorsWithAttribute:NSForegroundColorAttributeName] length]];
    self.outlineCharactorLabel.text = [NSString stringWithFormat:@"%lu outline charactors", (unsigned long)[[self charactorsWithAttribute:NSStrokeWidthAttributeName] length]];
}

@end
