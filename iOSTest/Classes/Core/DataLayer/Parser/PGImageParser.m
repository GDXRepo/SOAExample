//
//  PGImageParser.m
//  iOSTest
//
//  Created by Георгий Малюков on 15.06.16.
//  Copyright © 2016 Polygant. All rights reserved.
//

#import "PGImageParser.h"


@implementation PGImageParser


#pragma mark - PGAbstractParser

- (Class)entityClass {
    return PGImageEntity.class;
}

- (Class)modelClass {
    return PGImageModel.class;
}

- (PGAbstractModel *)parseEntity:(PGAbstractEntity *)entity {
    [super parseEntity:entity];
    
    PGImageEntity *modelFrom = (PGImageEntity *)entity;
    PGImageModel *model = [PGImageModel new];
    
    model.imageName = modelFrom.imageName;
    model.image = [UIImage imageNamed:model.imageName];
    model.text = modelFrom.text;
    
    return model;
}

- (PGAbstractEntity *)parseModel:(PGAbstractModel *)model {
    [super parseModel:model];
    
    PGImageModel *entityFrom = (PGImageModel *)model;
    PGImageEntity *entity = [PGImageEntity new];
    
    entity.imageName = entityFrom.imageName;
    entity.text = entityFrom.text;
    
    return entity;
}

@end
