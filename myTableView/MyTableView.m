//
//  MyTableView.m
//  myTableView
//
//  Created by macbook on 13/10/31.
//  Copyright (c) 2013年 teiron. All rights reserved.
//

#import "MyTableView.h"
#import "MyCell.h"

@interface MyTableView ()

@end

@implementation MyTableView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        // 创建 TableView
        _myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height) style:UITableViewStylePlain];
        _myTableView.dataSource = self;
        _myTableView.delegate = self;
        [self addSubview:_myTableView];
        
        _curRowNumber = 0;
        _softNameList = [[NSMutableArray alloc]initWithObjects:@"1.僵尸吃了我的医生",
                                                                 @"2.国王的荣耀 (火爆新版本),下载就送全状态高级练级装备",
                                                                 @"3.逃出死人堆",
                                                                 @"4.万圣节方块射击",
                                                                 @"5.LBE安全大师",
                                                                 @"6.狂奔的猕猴桃骑士",
                                                                 @"7.生存战争",
                                                                 @"8.沙盒",
                                                                 @"9.狂热的花园",
                                                                 @"10.龙腾世纪 : 英雄",
                                                                 @"11.手指忍者 直装版",
                                                                 @"12.坦克大战3D",
                                                                 @"13.小企鹅爱吃鱼",
                                                                 @"14.无法无天 Lawless",
                                                                 @"15.死亡扳机2 Dead Trigger 2",
                                                                 @"16.51信用卡管家",
                                                                 @"17.优酷",
                                                                 @"18.神秘种族Echo Prime",
                                                                 @"19.梦想海贼王（登陆送路飞）",
                                                                 @"20.艺龙酒店-酒店预订专家",
                                                                 @"21.暴力反击 Fightback",
                                                                 @"22.美团团购-优惠,美食,酒店,电影,酒店,美容,",
                                                                 @"23.土豆",
                                                                 @"24.UC浏览器 UCBrowser for iphone",
                                                                 @"25.靛蓝湖畔 Indigo Lake",
                                                                 @"26.搜狐新闻-全网独家直播好声音",
                                                                 @"27.机械迷城",
                                                                 @"28.弧光中队：回归",
                                                                 @"29.大众点评",
                                                                 @"30.英雄指环",
                                                                 @"31.米皮历险记 Mimpi",
                                                                 @"32.疯兔大爆炸 Rabbids Big Bang",
                                                                 @"33.在路上",
                                                                 @"34.死亡像素 Mega Dead Pixel",
                                                                 @"35.无敌铁拳 FIST OF AWESOME",
                                                                 @"36.怪兽大联欢 Monster 500",
                                                                 @"37.6号设备 Device 6",
                                                                 @"38.速度与激情6：游戏",
                                                                 @"39.爱丽丝快跑",
                                                                 @"40.星空消消看 PopStar!", nil];
    }
    return self;
}

- (void)viewDidLoad
{
    // TODO: //
}

- (void)dealloc
{
    [super dealloc];
    [_myCell release];
    [_myTableView release];
    [_softNameList release];
}


#pragma mark - @protocol UITableViewDataSource
// 设置行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    NSLog(@"==== count = %d ====", _softNameList.count+1);
    return [_softNameList count] + 1;  // 加上ScrollView那一行
}

// 设置行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    static int i = 1;
//    NSLog(@"==== i = %d ====", i++);
    if (indexPath.row == 0)
    {
        return 100;     // ScrollView那一个Cell
    }
    return 50;
}

#pragma mark - @protocol UITableViewDelegate
// 生成或拖动时触发
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    _curRowNumber = [indexPath row];
    NSLog(@"_curRowNumber = %d", _curRowNumber);
    
    static NSString *scrollViewCellID = @"scrollViewCellID";  //scrollView和其他普通的Cell，两者都不能互相重用，两者格式不兼容
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = nil;
    int whichCell;
    if (_curRowNumber == 0)
    {
        whichCell = 0;
        cell = [tableView dequeueReusableCellWithIdentifier:scrollViewCellID]; // 取得scrollView的可重用Cell
    }
    else
    {
        whichCell = 1;
        cell = [tableView dequeueReusableCellWithIdentifier:cellID];        // 取得普通Cell的可重用Cell
        
        // 设置行号
        [MyCell setCellRow:_curRowNumber-1];   // 减去ScrollView那行，相当于从第0行开始
    }
    
    
    // 如果没有可重用的Cell，则创建
    if(cell == nil)
    {        
        if (whichCell == 0)
        {
            static int i = 1;
            NSLog(@" ------ Create ScrollView %d time", i++);
            // 创建ScrollView那个Cell
            cell = [[MyCell alloc]initWithScrollView:UITableViewCellStyleDefault reuseIdentifier:scrollViewCellID];
        }
        else
        {
            // 复制名字数组
            static BOOL hasCopyNameList = NO;
            if (hasCopyNameList == NO)
            {
                [MyCell copySoftNameArray:_softNameList];
                hasCopyNameList = YES;
            }
            
            static int j = 1;
            NSLog(@" ++++++ Create other cell %d time", j++);
            // 创建一个cell,(向上取整,一共创建屏幕能显示的数目的Cell)
            cell = [[MyCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        }
        
    }
    // 复用Cell
    else
    {
        if (whichCell != 0)
        {
            [(MyCell *)cell flushCell:_curRowNumber-1];
        }
        
    }
    
    return cell;
}


/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

@end
