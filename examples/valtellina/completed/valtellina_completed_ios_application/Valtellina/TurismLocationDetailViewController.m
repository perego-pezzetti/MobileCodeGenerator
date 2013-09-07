#import "TurismLocationDetailViewController.h"

@interface TurismLocationDetailViewController ()
@property (weak, nonatomic) IBOutlet UITextView *titleTextView;
@property (weak, nonatomic) IBOutlet UITextView *descriptionTextView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation TurismLocationDetailViewController



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
	self.titleTextView.text = self.selectedItemTitle;
    self.imageView.image = [UIImage imageNamed:self.selectedItemImageFilename];
    NSString* textFilename = [[self.selectedItemDescriptionFilename componentsSeparatedByString:@"."] objectAtIndex:0];
    NSString* textExtension = [[self.selectedItemDescriptionFilename componentsSeparatedByString:@"."] objectAtIndex:1];
    NSString* filePath = [[NSBundle mainBundle] pathForResource:textFilename ofType:textExtension];
	self.descriptionTextView.text = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
