//
//  ViewController.m
//  30-UITableView-Dynamic-Cells
//
//  Created by Slava on 12.06.17.
//  Copyright © 2017 Vyacheslav Bortnichenko. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIEdgeInsets inset = UIEdgeInsetsMake(20, 0, 0, 0);
    self.tableView.contentInset = inset;
    self.tableView.scrollIndicatorInsets = inset;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    NSLog(@"numberOfSectionsInTableView");
    return [[UIFont familyNames] count];    // возвращенм число равное количеству шрифтов
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    NSLog(@"numberOfRowsInSection: %ld", (long)section);
    NSArray *familyNames = [UIFont familyNames];
    NSString *familyName = [familyNames objectAtIndex:section];
    NSArray *fontNames = [UIFont fontNamesForFamilyName:familyName];
    return fontNames.count;
}
// заголовок секции
- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSArray *familyNames = [UIFont familyNames];
    NSString *familyName = [familyNames objectAtIndex:section];
    return familyName;
}
// ячейки
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    NSLog(@"cellForRowAtIndexPath: {%ld, %ld}", (long)indexPath.section, (long )indexPath.row);
    static NSString *identifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        NSLog(@"cell created");
    } else {
        NSLog(@"cell reused");
    }

    NSArray *familyNames = [UIFont familyNames];
    NSString *familyName = [familyNames objectAtIndex:indexPath.section];
    NSArray *fontNames = [UIFont fontNamesForFamilyName:familyName];
    NSString *fontName = [fontNames objectAtIndex:indexPath.row];
    cell.textLabel.text = fontName;
    UIFont *font = [UIFont fontWithName:fontName size:16];
    cell.textLabel.font = font;
    return cell;
}




@end
