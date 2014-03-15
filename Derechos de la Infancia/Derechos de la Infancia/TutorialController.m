//
//  TutorialController.m
//  Gastalón
//
//  Created by Daniel García Alvarado on 01/01/14.
//  Copyright (c) 2014 Dragonfly Labs. All rights reserved.
//

#import "TutorialController.h"
#import "AppDelegate.h"

@interface TutorialController ()
@property (nonatomic, strong) NSArray *pageImages;
@property (nonatomic, strong) NSMutableArray *pageViews;

- (void)loadVisiblePages;
- (void)loadPage:(NSInteger)page;
- (void)purgePage:(NSInteger)page;
@end

@implementation TutorialController

@synthesize scrollView = _scrollView;
@synthesize pageControl = _pageControl;
@synthesize pageImages = _pageImages;
@synthesize pageViews = _pageViews;

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
    self.pageImages = [NSArray arrayWithObjects:
                       @"Los derechos de los niños lalalalallaa",
                       @"Mas cosas de los derechos de los niños\nlalalalalala",
                       @"Empezar",
                       nil];
    
    NSInteger pageCount = self.pageImages.count;
    self.pageControl.currentPage = 0;
    self.pageControl.numberOfPages = pageCount;
    self.pageViews = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < pageCount; ++i) {
        [self.pageViews addObject:[NSNull null]];
    }
    [self setNeedsStatusBarAppearanceUpdate];
    self.view.backgroundColor = [UIColor colorWithRed:209.0/255.0 green:28.0/255.0 blue:26.0/255.0 alpha:1];
}

- (void)loadPage:(NSInteger)page {
    if (page < 0 || page >= self.pageImages.count) {
        return;
    }
    UIView *pageView = [self.pageViews objectAtIndex:page];
    if ((NSNull*)pageView == [NSNull null]) {
        if(page != 2){
            UITextView *newPageView = [UITextView new];
            newPageView.text = [self.pageImages objectAtIndex:page];
            newPageView.backgroundColor = [UIColor clearColor];
            newPageView.textColor = [UIColor whiteColor];
            newPageView.textAlignment = NSTextAlignmentCenter;
            newPageView.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:23];
            [newPageView setUserInteractionEnabled:NO];
            CGRect frame = self.scrollView.bounds;
            frame.origin.x = frame.size.width * page;
            frame.origin.y = frame.size.height - 150;
            newPageView.frame = frame;
            [self.scrollView addSubview:newPageView];
            [self.pageViews replaceObjectAtIndex:page withObject:newPageView];
        }else{
            UIButton * newPageView = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            [newPageView setTitle:[self.pageImages objectAtIndex:page] forState:UIControlStateNormal];
            newPageView.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:23];
            [newPageView setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            newPageView.layer.cornerRadius = 3.0f;
            newPageView.layer.borderWidth = 1.5f;
            newPageView.layer.borderColor = [UIColor whiteColor].CGColor;
            [newPageView addTarget:self action:@selector(empezar) forControlEvents:UIControlEventTouchUpInside];
            CGRect frame = self.scrollView.bounds;
            frame.origin.x = frame.size.width * page + 40;
            frame.size.width -= 80;
            frame.origin.y = frame.size.height - 150;
            frame.size.height = 60.0f;
            newPageView.frame = frame;
            [self.scrollView addSubview:newPageView];
            [self.pageViews replaceObjectAtIndex:page withObject:newPageView];
        }
    }
}

-(void)empezar{
    
}
             
- (void)purgePage:(NSInteger)page {
    if (page < 0 || page >= self.pageImages.count) {
        return;
    }
    UIView *pageView = [self.pageViews objectAtIndex:page];
    if ((NSNull*)pageView != [NSNull null]) {
        [pageView removeFromSuperview];
        [self.pageViews replaceObjectAtIndex:page withObject:[NSNull null]];
    }
} 

- (void)loadVisiblePages {
    CGFloat pageWidth = self.scrollView.frame.size.width;
    NSInteger page = (NSInteger)floor((self.scrollView.contentOffset.x * 2.0f + pageWidth) / (pageWidth * 2.0f));
    self.pageControl.currentPage = page;
    NSInteger firstPage = page - 1;
    NSInteger lastPage = page + 1;
    for (NSInteger i=0; i<firstPage; i++) {
        [self purgePage:i];
    }
    for (NSInteger i=firstPage; i<=lastPage; i++) {
        [self loadPage:i];
    }
    for (NSInteger i=lastPage+1; i<self.pageImages.count; i++) {
        [self purgePage:i];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self loadVisiblePages];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    CGSize pagesScrollViewSize = self.scrollView.frame.size;
    self.scrollView.contentSize = CGSizeMake(pagesScrollViewSize.width * self.pageImages.count, 1.0);
    self.scrollView.clipsToBounds = YES;
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [self loadVisiblePages];
}


-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

@end
