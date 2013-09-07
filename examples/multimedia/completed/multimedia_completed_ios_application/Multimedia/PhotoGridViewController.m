#import "PhotoGridViewController.h"
#import "CustomCollectionViewCell.h"
#import "PhotoViewerViewController.h"

@interface PhotoGridViewController ()
@property (weak, nonatomic) IBOutlet UICollectionView *photosGridView;
@property (strong, nonatomic) NSArray *photosGridViewContents;

@end

@implementation PhotoGridViewController

-(NSArray *)photosGridViewContents {
    	_photosGridViewContents = [self filesAtPath:[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingString:@"/images"]];
    return _photosGridViewContents;
}


-(NSArray*)filesAtPath:(NSString *)path
{
    NSDirectoryEnumerator* directory = [[NSFileManager defaultManager] enumeratorAtURL:[NSURL URLWithString:path] includingPropertiesForKeys:nil options:0 errorHandler:NULL];
    NSMutableArray* files = [[NSMutableArray alloc] init];
    for (NSURL *url in directory) {
        NSString* filename = [[url absoluteString] lastPathComponent];
        [files addObject:filename];
    }
    return files;
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
    [self.photosGridView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





#pragma mark - Collection view DataSource 
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
	// Return the number of sections.
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
	// Return the number of items in the section.
    if (collectionView == self.photosGridView) {
        return self.photosGridViewContents.count;
    }
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *CellIdentifier = @"CellIdentifier";
    CustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];

    if (collectionView == self.photosGridView) {
       
        NSString* imagesPath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingString:@"/images"];
        NSString *localImagePath= [[NSString alloc] initWithString:[NSString stringWithFormat:@"%@/%@",imagesPath,[self.photosGridViewContents objectAtIndex:indexPath.item]]];
        cell.imageView.image = [[UIImage alloc] initWithContentsOfFile:localImagePath];
    }
	return cell;
}

#pragma mark - Collection view Delegate
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (collectionView == self.photosGridView) {
        NSString *clickedItem = [self.photosGridViewContents objectAtIndex:indexPath.item];
       	PhotoViewerViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"PhotoViewerViewController"];
       	// Navigation logic may go here: configure properties of PhotoViewerViewController
        vc.filename = clickedItem;
       	[[self navigationController] pushViewController:vc animated:YES];
    }
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
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
