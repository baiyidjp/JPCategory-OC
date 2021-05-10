//
//  CrashGuardViewController.m
//  JPCategoryOCDemo
//
//  Created by baiyidjp on 2021/5/8.
//

#import "CrashGuardViewController.h"

@interface CrashGuardViewController ()

/** mutableArray */
@property(nonatomic,strong) NSMutableArray *mutableArray;
/** dict */
@property(nonatomic,strong) NSMutableDictionary *dict;

@end

@implementation CrashGuardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

}
- (IBAction)addNilObject:(id)sender {
    
    [self.mutableArray addObject:nil];
    [self.mutableArray insertObject:@"1" atIndex:4];
    [self.mutableArray addObject:@"0"];
    [self.mutableArray addObject:@"0"];
    [self.mutableArray addObject:@"0"];
    [self.mutableArray addObject:@"0"];
    [self.mutableArray addObject:@"0"];
    [self.mutableArray insertObjects:@[@"8", @"9"] atIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(6, 2)]];
}
- (IBAction)getObject:(id)sender {
    
    [self.mutableArray addObject:@"0"];
    self.mutableArray[20];
    [self.mutableArray objectAtIndex:20];
    [self.mutableArray objectsAtIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(6, 2)]];
}
- (IBAction)dictAdd:(id)sender {
    
    self.dict[@"nil"] = nil;
    [self.dict setObject:nil forKey:@"NotNil"];
    
    NSString *nilS = nil;
    NSDictionary *dict2 = @{nilS: @"nilS"};
    NSDictionary *dict3 = @{@"nilS": nilS};
    [NSDictionary dictionaryWithObject:nilS forKey:@"nilK"];
}
- (IBAction)dictGet:(id)sender {
    
    self.dict[@"1"];
    self.dict[nil];
    [self.dict objectForKey:@"nn"];
    [self.dict objectForKeyedSubscript:nil];
    self.dict[@"1"] = @"1";
    self.dict[@"2"] = @"2";

    NSDictionary *dict1 = [NSDictionary dictionary];
    dict1[nil];
    [dict1 objectForKey:nil];
    
}
- (IBAction)unrecognized:(id)sender {
    
    JPObjcClass *objc = [[JPObjcClass alloc] init];
    [objc test];
    
    [JPObjcClass testM];
}

- (NSMutableArray *)mutableArray {
    
    if (!_mutableArray) {
        
        _mutableArray = [NSMutableArray array];
    }
    return _mutableArray;
}

- (NSMutableDictionary *)dict {
    
    if (!_dict) {
        
        _dict = [NSMutableDictionary dictionary];
    }
    return _dict;
}

@end

@implementation JPObjcClass

//+ (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
//
//    NSLog(@"___methodSignatureForSelector");
//    return [NSMethodSignature signatureWithObjCTypes:"v@:"];
//}
//
//+ (void)forwardInvocation:(NSInvocation *)anInvocation {
//
//    NSLog(@"forwardInvocation");
//}

@end
