//
//  LBMovies_VC.m
//  LBMoviesPossession
//
//  Bison个人博客地址---http://allluckly.cf/
//  Copyright (c) 2015年 Bison. All rights reserved.
//

#import "LBMovies_VC.h"

@interface LBMovies_VC ()
{
    CGFloat lastContentOffset;
    NSArray *Arr;
    UITableView *tabview;
}
@end

@implementation LBMovies_VC

- (void)viewDidLoad {
    [super viewDidLoad];
    Arr = [NSArray arrayWithObjects:@"Bison个人博客地址---01",@"http://allluckly.cf/",@"欢迎参观探讨",@"Bison个人博客地址--02",@"http://allluckly.cf/",@"Bison个人博客地址---4",@"Bison个人博客地址---5",@"Bison个人博客地址---06",@"Bison个人博客地址---07",@"Bison个人博客地址---08",@"Bison个人博客地址---09",@"Bison个人博客地址---10",@"Bison个人博客地址---11",@"Bison个人博客地址---12",@"Bison个人博客地址---13",@"Bison个人博客地址---14",@"Bison个人博客地址---15",@"Bison个人博客地址---16",@"Bison个人博客地址---17",@"Bison个人博客地址---18",@"Bison个人博客地址---19",@"Bison个人博客地址---20",@"Bison个人博客地址---21",@"Bison个人博客地址---22",@"Bison个人博客地址---23",@"Bison个人博客地址---24",@"Bison个人博客地址---25",@"Bison个人博客地址---0",@"Bison个人博客地址---0",@"Bison个人博客地址---0",@"Bison个人博客地址---0",@"Bison个人博客地址---0",@"Bison个人博客地址---0",@"Bison个人博客地址---0",@"Bison个人博客地址---0",@"Bison个人博客地址---0", nil];
    tabview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    tabview.delegate = self;
    tabview.dataSource = self;
    [self.view addSubview:tabview];
    _TopView = [[UIView alloc]initWithFrame:CGRectMake(self.view.frame.size.width-50, self.view.frame.size.height-80, 40, 40)];
    _TopView.backgroundColor = [UIColor lightGrayColor];
    
    _TopView.layer.cornerRadius = 20.0f;
    _TopView.clipsToBounds = YES;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, _TopView.frame.size.width, _TopView.frame.size.height);
    [btn setTitle:@"Top" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(DoSomething) forControlEvents:UIControlEventTouchUpInside];
    [_TopView addSubview:btn];
    [self.view addSubview:_TopView];
   
    
}
#pragma mark - btn 点击事件
- (void)DoSomething{
    //到顶部
    [tabview setContentOffset:CGPointMake(0, -60) animated:YES];
    
}

#pragma mark - UITableView Delegate and Datasource functions
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return Arr.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1;
}
- (CGFloat)tableView: (UITableView*)tableView heightForRowAtIndexPath: (NSIndexPath*) indexPath {
    return 53;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIdentifier = @"ContactCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = Arr[indexPath.row];
    
    return cell;
}

-(void)scrollViewWillBeginDragging:(UIScrollView*)scrollView{
    
    
    lastContentOffset = scrollView.contentOffset.y;
}

-( void )scrollViewDidScroll:( UIScrollView *)scrollView {
    
    
    if (scrollView.contentOffset.y < lastContentOffset )
    {
        //向上
        _TopView.hidden = NO;

    } else if (scrollView. contentOffset.y >lastContentOffset){
        //向下
        CATransition *animation = [CATransition animation];
        animation.type = kCATransitionMoveIn;
        animation.duration = 1.0f;
        [_TopView.layer addAnimation:animation forKey:nil];
        _TopView.hidden = YES;
    }
}


@end
