#import "DescriptionViewController.h"
#import "ImageDownloadingTask.h"

@interface DescriptionViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *descriptionWebView;
@property (weak, nonatomic) IBOutlet UIImageView *logoImageView;
@end

@implementation DescriptionViewController



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
	NSString *descriptionWebViewFileName = @"valtellina";
	NSString *descriptionWebViewFilePath = [[NSBundle mainBundle] pathForResource:descriptionWebViewFileName ofType:@"html"];
	NSString *descriptionWebViewDataString = [NSString stringWithContentsOfFile:descriptionWebViewFilePath encoding:NSUTF8StringEncoding error:nil];
	[self.descriptionWebView loadHTMLString:descriptionWebViewDataString baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] bundlePath]]];
	
	//download the image and set the ImageView
	[[[ImageDownloadingTask alloc] init] downloadImageFromUrl:@"http://www.elitestudio.it/news/valtellina.gif" forImageView:self.logoImageView];
	
	
	
	
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
