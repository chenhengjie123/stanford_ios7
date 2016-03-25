//
//  DropitBehavior.h
//  Dropit
//
//  Created by Hengjie.chj on 22/2/2016.
//  Copyright © 2016 hengjie.chj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DropitBehavior : UIDynamicBehavior

- (void) addItem: (id <UIDynamicItem>)item;
- (void) removeItem: (id <UIDynamicItem>)item;

@end
