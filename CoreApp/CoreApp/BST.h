#import <Foundation/Foundation.h>
#import "BNode.h"

@interface BST : NSObject
{
    BNode* _root;
}

@property(nonatomic, retain)BNode* root;

-(id)init;
-(void)insert:(BNode*)node;
-(void)inOrderTraveral:(BNode*)rootNode array:(NSMutableArray*)array;
-(void)preOrderTraveral:(BNode*)rootNode array:(NSMutableArray*)array;
-(void)postOrderTraveral:(BNode*)rootNode array:(NSMutableArray*)array;
-(bool)contains:(BNode*)node;
-(BNode*)remove:(BNode*)rootNode remove:(BNode*)node;


-(BNode*)maxLeftSubTree:(BNode*)node;
-(BNode*)minRightSubTree:(BNode*)node;


@end
