//
//  ViewController.m
//  登录
//
//  Created by lyy on 2017/8/9.
//  Copyright © 2017年 LVY. All rights reserved.
//

/*
 
 网络安全！
 原则1：在互联网上，不允许“明文”传递用户隐私！！
 
 */

#import "ViewController.h"
#import "NSString+Hash.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *uid;
@property (weak, nonatomic) IBOutlet UITextField *pwd;

@end

/**盐，要最够长*/
static NSString *salt = @"@$##@IIDDDKKKD{]POO333K3KJ993@JIIIDJIWH{||IIDIEEIEWKWKKKKKWK*&YY%^YYY";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)login:(UIButton *)sender {
    
    NSString *uid = self.uid.text;
    NSString *pwd = self.pwd.text;
    //--MD5
//    pwd = pwd.md5String;
    
    //早期的解决方案--加盐
    //弊端：盐写死了！一旦泄漏后果不堪设想
//    pwd = [pwd stringByAppendingString:salt];

    //HMAC  用一个密钥加密并且做了两次散列
    pwd = [pwd hmacMD5StringWithKey:pwd];
    
    
    NSLog(@"%@",pwd);
    
    //发送网络请求
    [self sendUid:uid pwd:pwd];
    
    
}

// 目前服务器不会保存明文密码 --没有找回密码操作更安全
- (BOOL)sendUid:(NSString *)uid pwd:(NSString *)pwd {
    
    //服务端验证是同过保存md5之后的值进行比对
    if ([uid isEqualToString:@"Lvy"] && [pwd isEqualToString:@"96e79218965eb72c92a549dd5a330112"]) {
        NSLog(@"登录成功");
    }else{
        NSLog(@"登录失败");
        
    }
    return YES;
    
}


@end
