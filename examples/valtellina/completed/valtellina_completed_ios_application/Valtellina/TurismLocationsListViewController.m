#import "TurismLocationsListViewController.h"
#import "TurismLocationDetailViewController.h"

@interface TurismLocationsListViewController ()
@property (weak, nonatomic) IBOutlet UITableView *turismLocationListView;
@property (strong, nonatomic) NSArray *turismLocationListViewContents;
@property (strong, nonatomic) NSArray *images;
@property (strong, nonatomic) NSArray *texts;
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
-(NSArray *)images {
    if(!_images){
    	_images = [[NSArray alloc] init];
		_images = @[
            @"aprica_img.jpg",
            @"bormio_img.jpg",
            @"chiesa_in_valmalenco_img.jpg",
            @"livigno_img.jpg",
            @"madesimo_img.jpg",
            @"santa_caterina_valfurva_img.jpg",
            @"teglio_img.jpg",
            @"tirano_img.jpg",
            @"val_masino_img.jpg",
            @"pianto_img.jpg",
            @"dazio_img.png",
        ];
    }
    return _images;
}

-(NSArray *)texts {
    if(!_texts){
    	_texts = [[NSArray alloc] init];
		_texts = @[
              @"aprica.txt",
              @"bormio.txt",
              @"chiesa_in_valmalenco.txt",
              @"livigno.txt",
              @"madesimo.txt",
              @"santa_caterina_valfurva.txt",
              @"teglio.txt",
              @"tirano.txt",
              @"val_masino.txt",
              @"pianto.txt",
              @"dazio.txt",
        ];
    }
    return _texts;
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
       	//Navigation logic may go here: configure properties of TurismLocationDetailViewController
        vc.selectedItemDescriptionFilename = [self.texts objectAtIndex:indexPath.row];
        vc.selectedItemTitle = clickedItem;
        vc.selectedItemImageFilename = [self.images objectAtIndex:indexPath.row];
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
