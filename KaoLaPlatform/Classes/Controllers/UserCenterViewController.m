//
//  UserCenterViewController.m
//  KaoLaPlatform
//
//  Created by Doyang on 14-4-8.
//  Copyright (c) 2014年 Onyx International Inc. All rights reserved.
//

#import "UserCenterViewController.h"

@interface UserCenterViewController ()

@end

@implementation UserCenterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if (_selectedIndexPath)
    {
        [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:_selectedIndexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setTitle:_text(@"kStrUserCenter")];
    
    _titleArray = @[_text(@"kStrExchangeGift"),
                    _text(@"kStrAddressInfo"),
                    _text(@"kStrExpressInfo"),
                    _text(@"kStrBigGiftBag")];
    _iconsArray = @[@"assets/ic_exchangegift",
                    @"assets/ic_addressinfo",
                    @"assets/ic_expressinfo",
                    @"assets/ic_big_giftbag"];
    [self.tableView setBackgroundView:nil];
    [self.tableView setBackgroundColor:[UIColor clearColor]];
    
    UIView *headerView =[[UIView alloc] initWithFrame:CGRectMake(0, 0, 320.0f, 20.0f)];
    CGFloat headerSeparatorViewHeight = 1.0f;
    if (IS_IOS_7)
    {
        headerSeparatorViewHeight = 0.5f;
    }
    
    UIView *headerSeparatorView = [[UIView alloc] initWithFrame:CGRectMake(0, 20.0f - headerSeparatorViewHeight, 320.0f, headerSeparatorViewHeight)];
    [headerSeparatorView setBackgroundColor:[UIColor colorWithRed:_color(216.0f) green:_color(216.0f) blue:_color(213.0f) alpha:1.0f]];
    [headerView addSubview:headerSeparatorView];
    self.tableView.tableHeaderView = headerView;
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320.0f, 0.5f)];
    if (IS_IOS_7)
    {
        [footerView setBackgroundColor:[UIColor colorWithRed:_color(216.0f) green:_color(216.0f) blue:_color(213.0f) alpha:1.0f]];
    }
    self.tableView.tableFooterView = footerView;
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

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_iconsArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"UserCenterTableViewCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (nil == cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
    }
    
    NSString *imageName = [_iconsArray objectAtIndex:indexPath.row];
    [cell.imageView setImage:_img(imageName)];
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    [cell.textLabel setText:[_titleArray objectAtIndex:indexPath.row]];
    [cell.textLabel setFont:_font(17.0f)];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}


#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    _selectedIndexPath = indexPath;
    
    UIViewController *nextViewController = nil;
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    switch (indexPath.row) {
        case 0:
        {
            nextViewController = [storyBoard instantiateViewControllerWithIdentifier:@"exchangeGiftViewController"];
        }
            break;
            
        case 1:
        {
            nextViewController = [storyBoard instantiateViewControllerWithIdentifier:@"addressInfoViewController"];
        }
            break;
            
        default:
        {
            nextViewController = [storyBoard instantiateViewControllerWithIdentifier:@"exchangeGiftViewController"];
        }
            break;
    }
    [self.navigationController pushViewController:nextViewController animated:YES];
}
@end
