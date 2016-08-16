//
//  XFView.m
//  xf-qq＋
//
//  Created by 朱晓峰 on 16/8/16.
//  Copyright © 2016年 朱晓峰. All rights reserved.
//

#import "XFView.h"

@interface XFView ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray *dataArray;
@end

@implementation XFView
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView=[[UITableView alloc]init];
        [self addSubview:_tableView];
        
    }
    return _tableView;
}
-(instancetype)initWithFrame:(CGRect)frame{

    if (self=[super initWithFrame:frame]) {
        self.tableView.dataSource=self;
        self.tableView.delegate=self;
        self.tableView.frame = CGRectMake(0, 10, self.bounds.size.width, self.bounds.size.height - 10);
        
        self.tableView.layer.cornerRadius = 10;
        self.tableView.clipsToBounds = YES;
        
        self.dataArray = @[@"扫一扫",
                           @"加好友",
                           @"创建讨论组",
                           @"发送到电脑",
                           @"面对面快传",
                           @"收钱"];
    }
    return self;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID=@"cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.textLabel.text=self.dataArray[indexPath.row];
    return cell;
}
-(void)drawRect:(CGRect)rect{
    
    [[UIColor whiteColor] set];
    
    CGContextRef contextRef=UIGraphicsGetCurrentContext();
    CGContextBeginPath(contextRef);
    CGContextMoveToPoint(contextRef, self.bounds.size.width - 40, self.tableView.frame.origin.y);
    
    CGContextAddLineToPoint(contextRef, self.bounds.size.width - 20, self.tableView.frame.origin.y);
    CGContextAddLineToPoint(contextRef, self.bounds.size.width - 20 * 1.5, self.tableView.frame.origin.y - 10);
    // 结束绘制
    CGContextClosePath(contextRef);
    // 填充色
    [[UIColor whiteColor] setFill];
    // 边框颜色
    [[UIColor whiteColor] setStroke];
    // 绘制路径
    CGContextDrawPath(contextRef, kCGPathFillStroke);
    
    
    
    
}

@end
