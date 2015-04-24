//
//  ViewController.m
//  TestCocoapod
//
//  Created by MC700 on 15/4/13.
//  Copyright (c) 2015年 MC700. All rights reserved.
//

#import "ViewController.h"
#import "pinyin.h"
//#import "WebViewJavascriptBridge.h"

@interface ViewController ()
//@property (strong, nonatomic) IBOutlet UIWebView *myWebView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    [self.myWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.baidu.com"]]];
   self.myWebView.backgroundColor = [UIColor whiteColor];
    self.view.backgroundColor = [UIColor whiteColor];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"kuahangzhuanzhangxieyi" ofType:@"htm"];
    NSURL *url = [NSURL fileURLWithPath:path];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.myWebView loadRequest:request];
    
    
    
//    [self.view addSubview:self.myWebView];    NSString *hanziText = @"我是中国人";
//    if ([hanziText length]) {
//        NSMutableString *ms = [[NSMutableString alloc] initWithString:hanziText];
//        if (CFStringTransform((__bridge CFMutableStringRef)ms, 0, kCFStringTransformMandarinLatin, NO)) {
//            NSLog(@"pinyin: %@", ms);
//        }
//        if (CFStringTransform((__bridge CFMutableStringRef)ms, 0, kCFStringTransformStripDiacritics, NO)) {
//            NSLog(@"pinyin: %@", ms);
//        }  
//    } 

   NSLog(@"张三===%@", [self writePingyinWithHanzi:@"张三"]);
}
-(NSString*)writePingyinWithHanzi:(NSString*)hanzi
{
    if (!hanzi) {
        return nil;
    }
    NSMutableString *string = [NSMutableString string];
    for (int i = 0; i < [hanzi length]; i++){
        unichar c = [hanzi characterAtIndex:0];
        if (c >=0x4E00 && c <=0x9FFF){
            [string appendFormat:@"%c",pinyinFirstLetter([hanzi characterAtIndex:i])];
        }else{
            [string appendFormat:@"%c",[hanzi characterAtIndex:i]];
        }
    }
    return string;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
