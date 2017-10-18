//
//  FindRankCell.m
//  YJXMLYFM
//
//  Created by wanyongjian on 2017/10/18.
//  Copyright © 2017年 eco. All rights reserved.
//

#import "FindRankCell.h"
@interface FindRankCell ()
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *mainTitle;
@property (weak, nonatomic) IBOutlet UILabel *middleTitle;
@property (weak, nonatomic) IBOutlet UILabel *bottomTitle;

@end



@implementation FindRankCell

- (void)setModel:(FindRankDetailModel *)model{
    [self.image sd_setImageWithURL:[NSURL URLWithString:model.coverPath]];
    self.mainTitle.text = model.title;
    self.middleTitle.text = model.firstKResults.count > 0? model.firstKResults[0].title:nil;
    self.bottomTitle.text = model.firstKResults.count > 2? model.firstKResults[1].title:nil;
}

+ (instancetype)findRankModelCell:(UITableView *)tableView{
    NSString *identifier = NSStringFromClass(self);
    UINib *nib = [UINib nibWithNibName:identifier bundle:nil];
    [tableView registerNib:nib forCellReuseIdentifier:identifier];
    return [tableView dequeueReusableCellWithIdentifier:identifier];
}
@end
