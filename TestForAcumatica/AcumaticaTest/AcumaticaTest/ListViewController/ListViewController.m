//
//  ListViewController.m
//  AcumaticaTest
//
//  Created by Artashes Yeghiazaryan on 7/3/19.
//  Copyright © 2019 Artashes Yeghiazaryan. All rights reserved.
//

#import "ListViewController.h"
#import "List.h"
#import "PersonModel.h"
#import "ListTableViewCell.h"
#import "DetailedViewController.h"

@interface ListViewController () <UITableViewDelegate, UITableViewDataSource, ListTableViewCellDelegate>

@property (strong, nonatomic) IBOutlet UITableView *listTableView;
@property (strong, nonatomic) UIRefreshControl *refreshControl;

@property (strong, nonatomic) NSMutableArray *listArray;

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"input" ofType:@"plist"]];
    NSArray *dataArray = [dictionary objectForKey:@"data"];
    NSArray *schemeArray = [dictionary objectForKey:@"scheme"];
    NSLog(@"dataArray = %@ \nschemeArray = %@", dataArray, schemeArray);
    
    
    
    self.listArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < dataArray.count; i++)
    {
        PersonModel *detiled = [[PersonModel alloc] initWithData:[dataArray objectAtIndex:i] withSchemeArray:schemeArray];
        [self.listArray addObject:detiled];
    }
    
    self.listTableView.delegate = self;
    self.listTableView.dataSource = self;
    
    NSString *nibName = NSStringFromClass([ListTableViewCell class]);
    [self.listTableView registerNib:[UINib nibWithNibName:nibName bundle:[NSBundle mainBundle]] forCellReuseIdentifier:nibName];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self reloadData];
}

- (void)reloadData
{
    __weak typeof(self) wself = self;
    
    [wself.listTableView reloadData];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.listArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellID = NSStringFromClass([ListTableViewCell class]);
    ListTableViewCell *cell = (ListTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    
    cell.delegate = self;
    
    [cell setCellWithModel:self.listArray[indexPath.row]];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.listTableView.bounds.size.width / 2;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    [self.navigationController pushViewController:[[DetailedViewController alloc] initWithData:[self.listArray objectAtIndex:indexPath.row]] animated:YES];
}

#pragma mark - ListTableViewCellDelegate

-(void) removeObjectFromData:(PersonModel *)detildeData
{
    [self.listArray removeObject:detildeData];
    [self.listTableView reloadData];
}

@end
