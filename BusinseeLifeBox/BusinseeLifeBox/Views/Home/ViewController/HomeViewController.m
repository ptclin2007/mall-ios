//
//  HomeViewController.m
//  UGOCMagicbox
//
//  Created by admin on 2019/7/1.
//  Copyright © 2019 UG. All rights reserved.
//

#import "HomeViewController.h"
#import "BlockCollectionView.h"
#import "HomeViewCollectionCell.h"
#import "NetWorkRequest+Home.h"

@interface HomeViewController ()

@property(strong, nonatomic) BlockCollectionView *collectionView;
@property(strong, nonatomic) NSMutableArray *todoArray;
@property(strong, nonatomic) NSDictionary *homeData;//服务器返回店铺数据

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configdata];
    [self configUI];
    
}
-(void)viewWillAppear:(BOOL)animated{
    [self tabAnimated];
    [self requestData];
}
-(void)configdata{
    
    self.todoArray = [@[
        @{
            @"key":@"BusinseeLifeBox.ShopManageViewController",
            @"icon":@"fa-github",
            @"title":@"店铺管理",
        },
        @{
            @"key":@"BusinseeLifeBox.WKwebViewController",
            @"icon":@"fa-github",
            @"title":@"商品管理",
            @"param":@{@"url":[NSString stringWithFormat:@"%@:%@/#/product",Global_Variable.shared.serviceIP,Global_Variable.shared.webPort]}
            
        },@{
            @"key":@"",
            @"icon":@"fa-github",
            @"title":@"订单管理",
        },
        @{
            @"key":@"BusinseeLifeBox.WKwebViewController",
            @"icon":@"fa-github",
            @"title":@"库存管理",
            @"param":@{@"url":[NSString stringWithFormat:@"%@:%@/#/",Global_Variable.shared.serviceIP,Global_Variable.shared.webPort]}
        },
        @{
            @"key":@"BusinseeLifeBox.WKwebViewController",
            @"icon":@"fa-github",
            @"title":@"数据管理",
            @"param":@{@"url":[NSString stringWithFormat:@"%@:%@/#/",Global_Variable.shared.serviceIP,Global_Variable.shared.webPort]}
        },
        @{
            @"key":@"",
            @"icon":@"fa-github",
            @"title":@"店铺营收",
        }
    ] modelCopy];
}
-(void)configUI{
    [self.navigationController setNavigationBarHidden:YES];
    [self.view addSubview:self.collectionView];
}

-(void)requestData{
    UG_WEAKSELF
    [[NetWorkRequest share] shopHomeDateBlock:^(NSDictionary * _Nullable dataDict, NSError * _Nullable error) {
        if (error) {
            [self.view ug_msg:error.domain];
        }else{
            self.homeData = dataDict;
            [weakSelf.collectionView reloadData];
        }
    }];
}

-(BlockCollectionView *)collectionView{
    UG_WEAKSELF
    if (!_collectionView) {
        _collectionView = [BlockCollectionView new];
        _collectionView.flowLayout.minimumLineSpacing = 2.0;
        _collectionView.flowLayout.minimumInteritemSpacing = 8.f;
        [_collectionView registerClass:[HomeViewCollectionCell class] forCellWithReuseIdentifier:@"HomeViewCollectionCell"];
        [_collectionView registerClass:[HomeViewCollectionToDoCell class] forCellWithReuseIdentifier:@"HomeViewCollectionToDoCell"];
        [_collectionView registerClass:[HomeViewCollectionBandleCell class] forCellWithReuseIdentifier:@"HomeViewCollectionBandleCell"];
        
        _collectionView.ug_numberOfSectionsInCollectionView = ^NSInteger(UICollectionView * _Nonnull collectionView) {
            return 4;
        };
        _collectionView.ug_numberOfItemsInSection = ^NSInteger(UICollectionView * _Nonnull collectionView, NSInteger section) {
            
            switch (section) {
                case 0:
                    return 1;
                    break;
                case 1:
                    return 2;
                    break;
                case 2:
                    return weakSelf.todoArray.count;
                    break;
                case 3:
                    return 1;
                    break;
                    
                default:
                    return 0;
                    break;
            }
        };
        _collectionView.ug_cellForItemAtIndexPath = ^__kindof UICollectionViewCell * _Nonnull(UICollectionView * _Nonnull collectionView, NSIndexPath * _Nonnull indexPath) {
            switch (indexPath.section) {
                case 0:
                {
                    HomeViewCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomeViewCollectionCell" forIndexPath:indexPath];
                    cell.visitorView.valueLab.text = [weakSelf.homeData stringValueForKey:@"readCount" default:0];
                    cell.addvisitorView.valueLab.text = [weakSelf.homeData stringValueForKey:@"followCount" default:0];
                    cell.orderView.valueLab.text = [weakSelf.homeData stringValueForKey:@"orderCount" default:0];
                    cell.amountaView.valueLab.text =[NSString stringWithFormat:@"%0.2f",[weakSelf.homeData floatValueForKey:@"orderAmount" default:0.00]] ;
                    return cell;
                }
                    break;
                case 1:
                {
                    HomeViewCollectionToDoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomeViewCollectionToDoCell" forIndexPath:indexPath];
                    cell.backgroundColor = [UIColor whiteColor];
                    return cell;
                }
                    break;
                case 2:
                {
                    BlockCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
                    cell.backgroundColor = [UIColor whiteColor];
                    NSDictionary *dic = [weakSelf.todoArray objectAtIndex:indexPath.row];
                    [cell.imageView setImage:[UIImage imageWithIcon:dic[@"icon"] backgroundColor:[UIColor clearColor] iconColor:[UIColor ug_random] andSize:CGSizeMake(32, 32)]];
                    cell.titleLab.text =dic[@"title"];
                    return cell;
                }
                    break;
                case 3:
                {
                    HomeViewCollectionBandleCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomeViewCollectionBandleCell" forIndexPath:indexPath];
                    cell.backgroundColor = [UIColor whiteColor];
                    [cell.imageView sd_setImageWithURL:UG_URL(@"https://raw.githubusercontent.com/UbunGit/TestRepo/master/image/girls/0.jpg")];
                    
                    return cell;
                }
                    break;
                    
                default:
                    return NULL;
                    break;
            }
        };
        //
        _collectionView.ug_sizeForItemAtIndexPath = ^CGSize(UICollectionView * _Nonnull collectionView, UICollectionViewLayout * _Nonnull layout, NSIndexPath * _Nonnull indexPath) {
            CGFloat conwight = KWidth-18;
            switch (indexPath.section) {
                case 0:
                    return CGSizeMake(conwight, 180);
                    break;
                case 1:
                    return CGSizeMake((conwight-6)/2, 40);
                    break;
                case 2:
                    return CGSizeMake((conwight-14)/3, 60);
                    break;
                case 3:
                    return CGSizeMake(conwight, 120);
                    break;
                    
                default:
                    return CGSizeMake(conwight, 40);
                    break;
            }
            
        };
        _collectionView.ug_insetForSectionAtIndex = ^UIEdgeInsets(UICollectionView * _Nonnull collectionView, UICollectionViewLayout * _Nonnull collectionViewLayout, NSInteger section) {
            switch (section) {
                case 0:
                    return UIEdgeInsetsMake(0, 8, 0, 8);;
                    break;
                case 1:
                    return UIEdgeInsetsMake(8, 8, 8, 8);;
                    break;
                case 2:
                    return UIEdgeInsetsMake(0, 8, 0, 8);;
                    break;
                case 3:
                    return UIEdgeInsetsMake(0, 8, 0, 8);;
                    break;
                    
                default:
                    return UIEdgeInsetsMake(0, 0, 0, 0);;
                    break;
            }
        };
        
        _collectionView.ug_referenceSizeForHeaderInSection = ^CGSize(UICollectionView * _Nonnull collectionView, UICollectionViewLayout * _Nonnull collectionViewLayout, NSInteger section) {
            return CGSizeMake(KWidth, 5);
        };
        
        _collectionView.ug_didSelectItemAtIndexPath = ^(UICollectionView * _Nonnull collectionView, NSIndexPath * _Nonnull indexPath) {
            switch (indexPath.section) {
                case 0:
                    
                    break;
                case 1:
                    
                    break;
                case 2:
                {
                    NSDictionary *dic = [weakSelf.todoArray objectAtIndex:indexPath.row];
                    [self routepush:dic[@"key"] param:dic[@"param"]];
                }
                    break;
                case 3:
                    
                    break;
                    
                default:
                    
                    break;
            }
        };
    }
    return _collectionView;
}
-(void)tabAnimated{
    //     self.collectionView.tabAnimated = [TABTableAnimated animatedWithCellClass:[TestTableViewCell class] cellHeight:100];
    //    self.collectionView.tabAnimated.adjustWithClassBlock = ^(TABComponentManager * _Nonnull manager, Class  _Nonnull __unsafe_unretained targetClass) {
    //
    //    };
    //
    //    [self.collectionView tab_startAnimationWithDelayTime:5. completion:^{
    //        [self afterGetData];
    //        [self.collectionView tab_endAnimationEaseOut];
    //    }];
    
}

-(void)afterGetData{
    
    [self.collectionView reloadData];
}
-(void)viewLayoutMarginsDidChange{
    [super viewLayoutMarginsDidChange];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0.0);
        make.top.mas_equalTo(KSAFE_Top);
        make.right.mas_equalTo(0.0);
        make.bottom.mas_equalTo(0.0);
    }];
}

@end
