#import "PhotoViewerViewController.h"

@interface PhotoViewerViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageViewerImageView;

@end

@implementation PhotoViewerViewController



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
	
    NSString* imagesPath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingString:@"/images"];
    NSString *localImagePath= [[NSString alloc] initWithString:[NSString stringWithFormat:@"%@/%@",imagesPath,self.filename]];
    self.imageViewerImageView.image = [[UIImage alloc] initWithContentsOfFile:localImagePath];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)deletePhotoButtonClickAction:(UIButton *)sender {
	[[NSFileManager defaultManager] removeItemAtPath:[[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingString:@"/images/"] stringByAppendingString:self.filename]  error:nil];
    [self.navigationController popViewControllerAnimated:YES];
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
