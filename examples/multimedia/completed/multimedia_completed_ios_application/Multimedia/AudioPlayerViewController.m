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
    
    NSString* audiosPath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingString:@"/audios"];
    NSString *localAudioPath= [[NSString alloc] initWithString:[NSString stringWithFormat:@"%@/%@",audiosPath,self.filename]];
    self.recordingAudioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL URLWithString:localAudioPath] error:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)deleteAudioButtonClickAction:(UIButton *)sender {
    [[NSFileManager defaultManager] removeItemAtPath:[[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingString:@"/audios/"] stringByAppendingString:self.filename]  error:nil];
    [self.navigationController popViewControllerAnimated:YES];
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
