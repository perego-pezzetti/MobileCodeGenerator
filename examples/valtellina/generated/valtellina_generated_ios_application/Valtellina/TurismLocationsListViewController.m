#import "TurismLocationsListViewController.h"
#import "TurismLocationDetailViewController.h"

@interface TurismLocationsListViewController ()
@property (weak, nonatomic) IBOutlet UITableView *turismLocationListView;
@property (strong, nonatomic) NSArray *turismLocationListViewContents;

@end

@implementation TurismLocationsListViewController
-(NSArray *)turismLocationListViewContents {
    if(!_turismLocationListViewContents){
    	_turismLocationListViewContents = [[NSArray alloc] init];
		_turismLocationListViewContents = @[
			@"Aprica",
			@"Bormio",
			@"Chiesa Valmalenco",
			@"Livigno",
			@"Madesimo",
			@"Santa Caterina Valfurva",
			@"Teglio",
			@"Tirano",
			@"Val Masino",
			@"Piantedo",
			@"Dazio",
		];
    }
    return _turismLocationListViewContents;
}



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
	
	
	
	
	
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if (tableView == self.turismLocationListView) {
        return self.turismLocationListViewContents.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];

    if (tableView == self.turismLocationListView) {
        cell.textLabel.text = [self.turismLocationListViewContents objectAtIndex:indexPath.row];
    }
	return cell;
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.turismLocationListView) {
        NSString *clickedItem = [self.turismLocationListViewContents objectAtIndex:indexPath.row];
       	TurismLocationDetailViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"TurismLocationDetailViewController"];
       	// Navigation logic may go here: configure properties of TurismLocationDetailViewController
       	[[self navigationController] pushViewController:vc animated:YES];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}






- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	// Auto-generated method stub
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
	// Auto-generated method stub
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
	// Auto-generated method stub
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{}

@end
