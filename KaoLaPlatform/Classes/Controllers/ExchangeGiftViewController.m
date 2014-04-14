//
//  ExchangeGiftViewController.m
//  KaoLaPlatform
//
//  Created by Doyang on 14-4-10.
//  Copyright (c) 2014年 Onyx International Inc. All rights reserved.
//

#import "ExchangeGiftViewController.h"
#import "ExchangeGiftTableViewCell.h"

@implementation ExchangeGiftTableViewOverlay

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    return [self.delegate overlayView:self didHitTest:point withEvent:event];
}

@end

@interface ExchangeGiftViewController ()

@end

@implementation ExchangeGiftViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setTitle:_text(@"kStrExchangeGift")];
    
    UIView *footer =[[UIView alloc] initWithFrame:CGRectZero];
    self.tableView.tableFooterView = footer;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)setOverlayVisible:(BOOL)visible
{
    if (visible)
    {
        self.overlayView = [[ExchangeGiftTableViewOverlay alloc] initWithFrame:self.view.bounds];
        self.overlayView.delegate = self;
        
        [self.overlayView setBackgroundColor:[UIColor clearColor]];
        [self.view addSubview:self.overlayView];
    }
    else
    {
        [self.overlayView removeFromSuperview];
    }
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"ExchangeGiftTableViewCell";
    if (nil == _nib)
    {
        _nib = [UINib nibWithNibName:@"ExchangeGiftTableViewCell" bundle:nil];
        [tableView registerNib:_nib forCellReuseIdentifier:cellIdentifier];
    }
    ExchangeGiftTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    cell.delegate = self;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 105.0f;
}

#pragma mark - UITableViewDelegate
- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([tableView cellForRowAtIndexPath:indexPath] == self.coverViewShowingCell)
    {
        [self.coverViewShowingCell setCoverViewVisible:NO];
        return NO;
    }
    return YES;
}

#pragma mark - ExchangeGiftTableViewCellDelegate
- (void)exchangeGiftTableViewCellDidConverViewShow:(ExchangeGiftTableViewCell *)cell
{
    self.coverViewShowingCell = cell;
    [self setOverlayVisible:YES];
}

- (void)exchangeGiftTableViewCellDidCoverViewDismiss:(ExchangeGiftTableViewCell *)cell
{
    self.coverViewShowingCell = nil;
    [self setOverlayVisible:NO];
}

#pragma mark - ExchangeGiftTableViewOverlayDelegate
- (UIView *)overlayView:(ExchangeGiftTableViewOverlay *)view didHitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    BOOL shouldIterceptTouches = YES;
    CGPoint location = [self.tableView convertPoint:point fromView:view];
    CGRect frame = self.coverViewShowingCell.frame;
    CGRect rect = [self.view convertRect:frame toView:self.view];
    shouldIterceptTouches = CGRectContainsPoint(rect, location);
    if (!shouldIterceptTouches)
    {
        [self.coverViewShowingCell setCoverViewVisible:NO];
    }
    
    return shouldIterceptTouches ? [self.coverViewShowingCell hitTest:point withEvent:event] : view;
}
@end
