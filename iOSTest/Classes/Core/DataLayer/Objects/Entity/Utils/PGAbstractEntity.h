//
//  PGAbstractEntity.h
//  iOSTest
//
//  Created by Георгий Малюков on 15.06.16.
//  Copyright © 2016 Polygant. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface PGAbstractEntity : NSObject<NSCopying> {
    NSString *_uid;
    NSString *_hash;
}

@property (readonly, nonatomic) NSString *uid;
@property (readonly, nonatomic) NSString *hash;


#pragma mark - Comparison

/*!
 Compares base classes and UID equality.
 
 @param entity Entity to compare with.
 @return YES if entities are subclassed from <tt>PGAbstractEntity</tt> and have identical UIDs.
 */
- (BOOL)isSameAs:(PGAbstractEntity *)entity;

/*!
 Compares base classes, UID and hashes equality.
 
 @param entity Entity to compare with.
 @return YES if entities are subclassed from <tt>PGAbstractEntity</tt>, have identical UIDs and hashes.
 */
- (BOOL)isEqualTo:(PGAbstractEntity *)entity;

@end
