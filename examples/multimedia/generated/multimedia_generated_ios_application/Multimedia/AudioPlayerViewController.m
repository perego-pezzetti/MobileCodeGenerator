#import "AudioPlayerViewController.h"

@interface AudioPlayerViewController ()
@property (strong, nonatomic) AVAudioPlayer *recordingAudioPlayer;

@end

@implementation AudioPlayerViewController



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

	//TODO decomment the next lines and insert file name and extension
	//NSURL* musicFile = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"filename..." ofType:@"extension..."]];
	//self.recordingAudioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:musicFile error:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)deleteAudioButtonClickAction:(UIButton *)sender {
	//TODO Implement the action
}


#pragma mark - AudioPlayer Management

- (IBAction)play:(UIButton *)sender
{
    [self.recordingAudioPlayer play];
}
- (IBAction)pause:(UIButton *)sender
{
    [self.recordingAudioPlayer pause];
}
- (IBAction)stop:(UIButton *)sender
{
    [self.recordingAudioPlayer pause];
    [self.recordingAudioPlayer setCurrentTime:0];
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
	if(self.recordingAudioPlayer!=nil && self.recordingAudioPlayer.isPlaying){
	    [self.recordingAudioPlayer pause];
	    [self.recordingAudioPlayer setCurrentTime:0];
	}
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{}

@end
