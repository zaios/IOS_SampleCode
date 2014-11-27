
#import "CenterViewController.h"

@interface CenterViewController ()

@end

@implementation CenterViewController

- (id) init
{
    self = [super init];
    if (self) {
        [self.view setBackgroundColor:[UIColor grayColor]];

        int margin = 10;
        
        m_button_David          = [UIButton buttonWithType:UIButtonTypeSystem];
        m_button_John           = [UIButton buttonWithType:UIButtonTypeSystem];
        m_button_Henry          = [UIButton buttonWithType:UIButtonTypeSystem];
        m_button_Jack           = [UIButton buttonWithType:UIButtonTypeSystem];

        // Init Button List
        m_button_List = [[[NSMutableArray alloc] initWithObjects:m_button_David,
                           m_button_John,
                           m_button_Henry,
                           m_button_Jack,
                           nil] retain];
        
        for (int i = 0; i < [m_button_List count]; i++)
        {
            UIButton* b = [m_button_List objectAtIndex:i];
            [b setFrame:CGRectMake( i * 60 + margin * (i + 1) , margin + 64, 60, 60)];
            [b setBackgroundColor:[UIColor blackColor]];
            [b setTag:i];
            [b addTarget:self action:@selector(act_Name:) forControlEvents:UIControlEventTouchUpInside];
            
            [self.view addSubview:b];
            //NSLog(@"b[%d]: %@", i, NSStringFromCGRect([b frame]));
        }
        
        // David
        [m_button_David setTitle:NSLocalizedStringFromTable(@"ID_BUTTON_DAVID", @"Simple", nil) forState:UIControlStateNormal];
        
        // John
        [m_button_John setTitle:NSLocalizedStringFromTable(@"ID_BUTTON_JOHN", @"Simple", nil) forState:UIControlStateNormal];
        
        // Henry
        [m_button_Henry setTitle:NSLocalizedStringFromTable(@"ID_BUTTON_HENRY", @"Simple", nil) forState:UIControlStateNormal];

        // Jack
        [m_button_Jack setTitle:NSLocalizedStringFromTable(@"ID_BUTTON_JACK", @"Simple", nil) forState:UIControlStateNormal];

        
        
    }
    return self;
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self addObserver:self forKeyPath:@"number" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - IBAction
- (void) act_Name:(id) sender
{
    UIButton* btn = (UIButton *) sender;
    
    switch ([btn tag]) {
        case 0:
            [self changeNumber:0];
            break;
        case 1:
            [self changeNumber:1];
            break;
        case 2:
            [self changeNumber:2];
            break;
        case 3:
            [self changeNumber:3];
            break;
        default:
            break;
    }
}

-(void) changeNumber:(int) value
{
    if (number == value)
        return;
    
    [self willChangeValueForKey:@"number"];
    number = value;
    [self didChangeValueForKey:@"number"];
    
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if([keyPath isEqualToString:@"number"])
    {
        id oldC = [change objectForKey:NSKeyValueChangeOldKey];
        id newC = [change objectForKey:NSKeyValueChangeNewKey];
        
        NSLog(@"%@ %@", oldC, newC);
    }
}

@end
