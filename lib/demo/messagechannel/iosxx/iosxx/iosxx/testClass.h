//
//  testClass.h
//  iosxx
//
//  Created by 李奕权 on 2019/7/9.
//  Copyright © 2019 李奕权. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface testClass : NSObject{
    NSString* name;
}


-(void) setName: (NSString*) newName;
-(NSString*) getName;
@end



NS_ASSUME_NONNULL_END
