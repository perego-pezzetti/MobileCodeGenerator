#import "VideoViewerViewController.h"

@interface VideoViewerViewController ()
@property (weak, nonatomic) IBOutlet UIView *videoViewerVideoView;
@property (strong, nonatomic) MPMoviePlayerController *moviePlayer;

@end

@implementation VideoViewerViewController



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
	NSURL *videoViewerVideoViewVideoFileUri = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"filename..." ofType:@"extension..."]]; //TODO insert local file name and extension
	self.moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL:videoViewerVideoViewVideoFileUri];
	[self.moviePlayer prepareToPlay];
	[self.moviePlayer.view setFrame: self.videoViewerVideoView.bounds];
	[self.videoViewerVideoView addSubview:self.moviePlayer.view];
	[self.moviePlayer play];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)deleteVideoButtonClickAction:(UIButton *)sender {
	//TODO Implement the action
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
