#import "HomeViewController.h"

@interface HomeViewController ()
@end

@implementation HomeViewController



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
	
	
	UIAlertView *homeProgressDialogAlertView = [[UIAlertView alloc] initWithTitle:@"Promemoria" message:@"Aggiornamento in corso…" delegate:self cancelButtonTitle:nil otherButtonTitles:nil];
	UIActivityIndicatorView *homeProgressDialog = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
	[homeProgressDialogAlertView show];
	homeProgressDialog.frame = CGRectMake(homeProgressDialogAlertView.frame.origin.x+homeProgressDialogAlertView.frame.size.width/2-homeProgressDialog.frame.size.width/2, homeProgressDialogAlertView.frame.size.height-homeProgressDialog.frame.size.height-20, 0.0, 0.0);
	[homeProgressDialogAlertView addSubview:homeProgressDialog];
	[homeProgressDialog startAnimating];
	//TODO do something before dismissing it.
	[homeProgressDialogAlertView dismissWithClickedButtonIndex:[homeProgressDialogAlertView cancelButtonIndex] animated:YES];
	[homeProgressDialogAlertView removeFromSuperview];
	
	
	
	[self performSelectorInBackground:@selector(notesDownloader) withObject:nil];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}









-(void)notesDownloader{
	//TODO code to be executed in the background task
	//[self performSelectorOnMainThread:@selector(executeOnMainThread) withObject:nil waitUntilDone:NO];
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
