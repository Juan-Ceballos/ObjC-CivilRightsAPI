//
//  ViewController.m
//  ObjectiveC-CivilRightsAPI
//
//  Created by Juan Ceballos on 2/25/21.
//

#import "ViewController.h"
#import "APIClient.h"
#import "Movie.h"

// private properties
@interface ViewController () <UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property APIClient *apiClient;
@property NSArray *movies;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.apiClient == nil) {
        self.apiClient = [[APIClient alloc] init];
    }
    

    [self fetchMovies];
    self.tableView.dataSource = self;
    NSLog(@"there are %lu", self.movies.count);
}

- (void) fetchMovies {
    [self.apiClient fetchCivilRightsMovies:^(NSError *error, NSArray *movies) {
        self.movies = movies;
        NSLog(@"there are %lu", self.movies.count);
        [self.tableView reloadData];
    }];
}

#pragma mark = UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.movies.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"movieCell" forIndexPath:indexPath];
    
    //Movie *movie
    Movie *movie = self.movies[indexPath.row];
    cell.textLabel.text = movie.originalTitle;
    //cell.detailTextLabel.text = @"";
    
    return cell;
}

@end
