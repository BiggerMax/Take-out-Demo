//
//  CAMERA.m
//  Onekit
//
//  Created by HeYanTao on 15/9/28.
//  Copyright © 2015年 张瑾. All rights reserved.
//

#import "CAMERA.h"
#import "UIViewController+Onekit.h"
#import "DIALOG.h"
#import "Macro.h"
@interface CAMERA()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property  (nonatomic,strong)Callback callback;
@property  (nonatomic,strong)VideoCallback videoCallback;
@property UIImage *m_image;
@end
static CAMERA *m_Instance = nil;
@implementation CAMERA
+ (void)init
{
    //[Onekit init];
}
+ (id)shareInstance{
    if (isNull(m_Instance)) {
        m_Instance = [[CAMERA alloc] init];
    }
    return m_Instance;
}
+(void)openCamera:(UIViewController*)viewController edit:(BOOL)edit callback:(Callback)callback
{
    [self init];
    if(m_Instance==nil){
        [CAMERA shareInstance];
    }
    m_Instance.callback = callback;
    //UIViewController* viewController = [UIViewController current];
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    if (![UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera]) {
        [DIALOG alert:NSLocalizedString(@"cantusephoto", nil)];
        sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    UIImagePickerController*picker = [[UIImagePickerController alloc]init];
    //UIImagePickerController *picker = [[UIImagePickerController alloc] init];//初始化
    picker.delegate = m_Instance;
    picker.allowsEditing = edit;//设置可编辑
    picker.sourceType = sourceType;
    [viewController presentViewController:picker animated:YES completion:Nil];//进入照相界面
    //[picker release];
}
+(void)openRecord:(VideoCallback)callback
{
    [self init];
    if(m_Instance==nil){
        [CAMERA shareInstance];
    }
    m_Instance.videoCallback = callback;
    UIViewController* viewController = [UIViewController current];
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = m_Instance;
    picker.allowsEditing = YES;
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        picker.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeCamera];
        picker.videoQuality = UIImagePickerControllerQualityTypeMedium; //录像质量
        //picker.videoMaximumDuration = 600.0f; //录像最长时间
        picker.mediaTypes = [NSArray arrayWithObjects:@"public.movie", nil];
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"温馨提示" message:@"当前设备不支持录像功能" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alert show];
    }
    //跳转到拍摄页面
    [viewController presentViewController:picker animated:YES completion:nil];
}
+(void)openGallery:(UIViewController*)viewController edit:(BOOL)edit callback:(Callback)callback
{
    [self init];
    if(m_Instance==nil){
        [CAMERA shareInstance];
    }
    m_Instance.callback = callback;
    //UIViewController* viewController = [UIViewController current];
    UIImagePickerController *pickerImage = [[UIImagePickerController alloc] init];
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        pickerImage.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        //pickerImage.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
        // pickerImage.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:pickerImage.sourceType];
    }
    pickerImage.delegate = m_Instance;
    pickerImage.allowsEditing = edit;
    [viewController presentViewController:pickerImage animated:YES completion:Nil];
}
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary*)info
{
    NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
    if ([mediaType isEqualToString:@"public.movie"]) {
        NSURL *videoURL = [info objectForKey:UIImagePickerControllerMediaURL];
        _videoCallback(videoURL);
    }
    else{
        UIImage *image;
        if(picker.allowsEditing){
            if (picker.sourceType == UIImagePickerControllerSourceTypePhotoLibrary){//如果打开相册
                image = [info objectForKey:UIImagePickerControllerEditedImage];
            }
            else{//照相机
                // [picker dismissModalViewControllerAnimated:YES];//关掉照相机
                image = [info objectForKey:UIImagePickerControllerEditedImage];
            }
        }else{
            if (picker.sourceType == UIImagePickerControllerSourceTypePhotoLibrary){//如果打开相册
                image = [info objectForKey:UIImagePickerControllerOriginalImage];
            }
            else{//照相机
                // [picker dismissModalViewControllerAnimated:YES];//关掉照相机
                image = [info objectForKey:UIImagePickerControllerOriginalImage];
            }

            
        }
        NSData *fdata = UIImageJPEGRepresentation(image, 0.8);
        UIImage *fImage = [UIImage imageWithData:fdata];
        _callback(fImage);
    }
    [picker dismissViewControllerAnimated:YES completion:^{
    }];
}
@end
