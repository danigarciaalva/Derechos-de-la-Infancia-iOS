//
//  TutorialController.h
//  Gastalón
//
//  Created by Daniel García Alvarado on 01/01/14.
//  Copyright (c) 2014 Dragonfly Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TutorialController : UIViewController<UIPickerViewDelegate>

@property (nonatomic, strong) IBOutlet UIScrollView *scrollView;
@property (nonatomic, strong) IBOutlet UIPageControl *pageControl;


@end
