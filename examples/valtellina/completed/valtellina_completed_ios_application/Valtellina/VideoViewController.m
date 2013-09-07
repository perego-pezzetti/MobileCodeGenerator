#import "VideoViewController.h"

@interface VideoViewController ()
@property (weak, nonatomic) IBOutlet UIView *videoView;
@property (strong, nonatomic) MPMoviePlayerController *moviePlayer;
@end

@implementation VideoViewController



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
	NSURL *videoViewVideoFileUri = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"valtellina_video" ofType:@"mp4"]];
	self.moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL:videoViewVideoFileUri];
	[self.moviePlayer prepareToPlay];
	[self.moviePlayer.view setFrame: self.videoView.bounds];
	[self.videoView addSubview:self.moviePlayer.view];
	[self.moviePlayer play];

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
