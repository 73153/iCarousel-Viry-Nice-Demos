//
//  ViewController.m
//  webview_demo
//
//  Created by broy denty on 13-8-20.
//  Copyright (c) 2013年 denty. All rights reserved.
//

#import "ViewController.h"
#import "HTMLNode.h"
#import "HTMLParser.h"
@interface ViewController ()
{
    NSData *data;
}
@end

@implementation ViewController
@synthesize webview;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    webview = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    
    NSURL * url = [NSURL URLWithString:@"http://iphone.alpha.wochacha.com/newposter/itemdetail?pkid=826759563&city_id=1&udid=71963a8a967a5796383215107c9b36ff2a8fdf09&openid=71963a8a967a5796383215107c9b36ff2a8fdf09&v=6.1&urid=149053158&connectnet=wifi"];
    
//    NSURL * url = [NSURL URLWithString:@"http://www.baidu.com"];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    NSLog(@"%@",request.description);
    
    NSLog(@"sadf%@",request.HTTPBodyStream);
    [self.view addSubview:self.webview];
    
    self.webview.delegate =self;
    self.webview.scalesPageToFit = YES;
//    [self.webview loadRequest:request];
    NSLog(@"didload%@" ,webview.request.allHTTPHeaderFields.description);

    
    
//    NSArray *array;
//    array = [self.webview subviews];
//    for (NSInteger i=0; i<array.count; i++)
//    {
//        if ([[array objectAtIndex:i] isKindOfClass:[UIScrollView class]])
//        {
//            NSLog(@"%d",i);
//            NSArray *array_img;
//            array_img = [[array objectAtIndex:i] subviews];
//            for (NSInteger l = 0; l<array_img.count; l++)
//            {
//                if ([[array_img objectAtIndex:l] isKindOfClass:[UIView class]]&&![[array_img objectAtIndex:l] isKindOfClass:[UIImageView class]])
//                {
//                    NSLog(@"%d",l);
//                    NSArray * array_pic;
//                    array_pic = [[array_img objectAtIndex:l] subviews];
//                    for (NSInteger n = 0; n<array_pic.count; n++)
//                    {
//                        if ([[array_pic objectAtIndex:n] isKindOfClass:[UIImageView class]])
//                        {
//                            NSLog(@"pic%d",n);
//                        }
//                    }
//                    
//                }
//            }
//        }
//        NSLog(@"%d",array.count);
//    }
    
       NSString *strResult = [NSString stringWithContentsOfURL: url encoding: NSUTF8StringEncoding error:nil];
    NSData *data = [NSData dataWithContentsOfURL:url ];
    NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    NSError *error = nil;
    HTMLParser *parser = [[HTMLParser alloc] initWithString:string error:&error];
    HTMLNode *bodyNode = [parser body];
    
    NSArray *imgNodes = [bodyNode findChildTags:@"img"];
    
    for (HTMLNode *inputNode in imgNodes)
    {
        if ([inputNode getAttributeNamed:@"width"] != nil)
        {
            NSLog(@"%@", [inputNode getAttributeNamed:@"width"]); //Answer to first question
            [inputNode setAttributeNamed:@"width" value:@"280"];
            [inputNode setAttributeNamed:@"height" value:@"200"];
            NSLog(@"%@", [inputNode getAttributeNamed:@"src"]);
            NSLog(@"%@", [inputNode rawContents] );
        
        }
    }
   
    NSLog(@"474747474747474747474747%@",[[parser doc] allContents] );

    [webview loadHTMLString:[[parser doc] rawContents]  baseURL:nil];
    
    
//    
//    NSArray *spanNodes = [bodyNode findChildTags:@"span"];
//    
//    for (HTMLNode *spanNode in spanNodes)
//    {
//        if ([[spanNode getAttributeNamed:@"class"] isEqualToString:@"spantext"]) {
//            NSLog(@"%@", [spanNode rawContents]); //Answer to second question
//        }
//    }

    
      
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)webViewDidStartLoad:(UIWebView *)webView
{
       NSLog(@"%@",[webView.request HTTPBody].description) ;
    NSLog(@"start");
    NSLog(@"startload%@" ,webView.request.allHTTPHeaderFields.description);

}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    
    
    NSLog(@"77777777&&&&&&&&&&&&&&&&&&&&%@",[[NSString alloc] initWithData:[[webView request] HTTPBody] encoding:NSASCIIStringEncoding]);
//      NSString *data = [[NSString alloc] initWithData:[webView.request HTTPBody] encoding:NSUTF8StringEncoding];
//    NSLog(@"didfinish%@" ,data);
//        NSLog(@"didfinish%@" ,webView.request.allHTTPHeaderFields.description);
//        webView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
//    [(NSMutableURLRequest *)webView.request setURL:[NSURL URLWithString:@"http://www.baidu.com"]];
//    NSLog(@"change%@",webView.request.description);
//    [webView loadRequest:webView.request];
    
    
    //    NSArray *array;
//    array = [self.webview subviews];
//    for (NSInteger i=0; i<array.count; i++)
//    {
//        if ([[array objectAtIndex:i] isKindOfClass:[UIScrollView class]])
//        {
//            NSLog(@"%d",i);
//            NSArray *array_img;
//            array_img = [[array objectAtIndex:i] subviews];
//            for (NSInteger l = 0; l<array_img.count; l++)
//            {
//                if ([[array_img objectAtIndex:l] isKindOfClass:[UIView class]]&&![[array_img objectAtIndex:l] isKindOfClass:[UIImageView class]])
//                {
//                    NSLog(@"%d",l);
//                    UIView *view;
//                    view = [array_img objectAtIndex:l];
//                    NSLog(@"asd%@",[view description]);
//                    view.frame = CGRectMake(0,0, 320,380);
//                      NSLog(@"asd%@",[view description]);
////                    NSArray * array_pic;
////                    array_pic = [[array_img objectAtIndex:l] subviews];
////                    for (NSInteger n = 0; n<array_pic.count; n++)
////                    {
////                        if ([[array_pic objectAtIndex:n] isKindOfClass:[UIImageView class]])
////                        {
////                            NSLog(@"pic%d",n);
////                        }
////                    }
//
//                }
//            }
//        }
//        NSLog(@"%d",array.count);
//    }
    

}
- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"will app%@" ,webview.request.allHTTPHeaderFields.description);
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSLog(@"error");
}
-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSLog(@"should**********************");
    NSLog(@"data%@___%@___%@",request.HTTPBody,request.HTTPBodyStream,request.description);
        [(NSMutableURLRequest *)request setURL:[NSURL URLWithString:@"http://www.baidu.com"]];
        NSLog(@"change%@",request.description);
//        [webView loadRequest:webView.request];
    return YES;
}
@end
