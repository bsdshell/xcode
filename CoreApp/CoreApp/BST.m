#import "BST.h"
#import "BNode.h"

@implementation BST : NSObject

-(id)init{
    if(self = [super init]){
        _root = nil;
        return self;
    }
    return nil;
}

-(void)insert:(BNode*)node{
    if(_root == nil){
        _root = node;
    }else{
        if([node data] < [_root data]){
            if([_root left] != nil){
                [self insert:node.left];
            }else{
                _root.left = node;
            }
        }else{
            if([_root right] != nil){
                [self insert:node.right];
            }else{
                _root.right = node;
            }
        }
    }
}

-(bool)contains:(BNode*)node{
    BNode* tmproot = _root;
    while(tmproot != nil){
        if([[tmproot data] integerValue] == [[node data] integerValue]){
            return true;
        }else{
            if([[node data] integerValue] < [[_root data] integerValue]){
                tmproot = tmproot.left;
            }else{
                tmproot = tmproot.right;
            }
        }
    }
    return false;
}

-(BNode*)minRightSubTree:(BNode*)node{
    while(node.left != nil){
        node = node.left;
    }
    return node;
}

-(BNode*)maxLeftSubTree:(BNode*)node{
    while(node.right != nil){
        node = node.right;
    }
    return node;
}

// reference
// http://www.cs.cmu.edu/~adamchik/15-121/lectures/Trees/code/BST.java
-(BNode*)remove:(BNode*)rootNode remove:(BNode*)node{
    if(rootNode != nil){
        if([node.data integerValue] < [[rootNode data] integerValue]){
            rootNode.left = [self remove:rootNode.left remove:node];
        }else if([node.data integerValue] > [[rootNode data] integerValue]){
            rootNode.right = [self remove:rootNode.right remove:node];
        }else{
            if(rootNode.left == nil) return rootNode.right;
            
            if(rootNode.right == nil) return rootNode.left;
            
            BNode* newNode = [self maxLeftSubTree:rootNode.left];
            rootNode.data = newNode.data;
            rootNode.left = [self remove:rootNode.left remove:newNode];
        }
        return rootNode;
    }
    return nil;
}

-(void)inOrderTraveral:(BNode*)rootNode array:(NSMutableArray*)array{
    if(rootNode != nil){
        [self inOrderTraveral:rootNode.left array:array];
        [array addObject:rootNode.data];
        [self inOrderTraveral:[rootNode right] array:array];
    }
}
-(void)preOrderTraveral:(BNode*)rootNode array:(NSMutableArray*)array{
    if(rootNode != nil){
        [array addObject:rootNode.data];
        [self preOrderTraveral:rootNode.left array:array];
        [self preOrderTraveral:rootNode.right array:array];
    }
}

-(void)postOrderTraveral:(BNode*)rootNode array:(NSMutableArray*)array{
    if(rootNode != nil){
        [self postOrderTraveral:rootNode.left array:array];
        [self postOrderTraveral:rootNode.right array:array];
        [array addObject:rootNode.data];
    }
}


@end
