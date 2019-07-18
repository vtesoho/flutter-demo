package com.vteso.image_tailor;

import android.app.Activity;
import android.content.Intent;

import com.luck.picture.lib.PictureSelector;
import com.luck.picture.lib.config.PictureConfig;
import com.luck.picture.lib.config.PictureMimeType;
import com.luck.picture.lib.entity.LocalMedia;
import com.luck.picture.lib.tools.PictureFileUtils;

import java.util.ArrayList;
import java.util.List;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/** ImageTailorPlugin */
public class ImageTailorPlugin implements MethodCallHandler, PluginRegistry.ActivityResultListener {


  private Activity activity;
  private Registrar registrar;
  private List<LocalMedia> selectList = new ArrayList<>();
  private Result result;

  public ImageTailorPlugin(Registrar registrar) {
    this.registrar = registrar;
    this.activity = registrar.activity();
  }

  /** Plugin registration. */
  public static void registerWith(Registrar registrar) {
    final MethodChannel channel = new MethodChannel(registrar.messenger(), "image_tailor");
    channel.setMethodCallHandler(new ImageTailorPlugin(registrar));
  }

  @Override
  public void onMethodCall(MethodCall call, Result result) {
    this.result = result;
    registrar.addActivityResultListener(this);
    if (call.method.equals("selectImg")) {
      int maxNum = call.argument("maxImages");
      int x = call.argument("width");
      int y = call.argument("height");
      startChooseImage(x,y,maxNum);
    } else if(call.method.equals("clearCache")) {
      PictureFileUtils.deleteCacheDirFile(activity);
    } else{
      result.notImplemented();
    }
  }



  /**
   * 选择图片并裁剪
   * @param x 横向比例
   * @param y 宽向比例
   * @param maxNum 最大数
   */
  private void startChooseImage(int x,int y, int maxNum){
    // 进入相册
    PictureSelector.create(activity)
            .openGallery(PictureMimeType.ofImage())//全部.PictureMimeType.ofAll()、图片.ofImage()、视频.ofVideo()、音频.ofAudio()
            .theme(R.style.picture_shuchi_style)
            .maxSelectNum(maxNum)// 最大图片选择数量 int
            .minSelectNum(1)// 最小选择数量 int
            .imageSpanCount(4)// 每行显示个数 int
            .selectionMode(PictureConfig.MULTIPLE)// 多选 or 单选 PictureConfig.MULTIPLE or PictureConfig.SINGLE
            .previewImage(true)// 是否可预览图片 true or false
            .isCamera(false)// 是否显示拍照按钮 true or false
            .imageFormat(PictureMimeType.PNG)// 拍照保存图片格式后缀,默认jpeg
            .isZoomAnim(true)// 图片列表点击 缩放效果 默认true
            .sizeMultiplier(0.5f)// glide 加载图片大小 0~1之间 如设置 .glideOverride()无效
            .enableCrop(true)// 是否裁剪 true or false
            .compress(true)// 是否压缩 true or false
            .withAspectRatio(x,y)// int 裁剪比例 如16:9 3:2 3:4 1:1 可自定义
            .hideBottomControls(true)// 是否显示uCrop工具栏，默认不显示 true or false
            .isGif(false)// 是否显示gif图片 true or false
            .freeStyleCropEnabled(false)// 裁剪框是否可拖拽 true or false
            .circleDimmedLayer(false)// 是否圆形裁剪 true or false
            .showCropFrame(true)// 是否显示裁剪矩形边框 圆形裁剪时建议设为false   true or false
            .showCropGrid(true)// 是否显示裁剪矩形网格 圆形裁剪时建议设为false    true or false
            .openClickSound(false)// 是否开启点击声音 true or false
            .previewEggs(true)// 预览图片时 是否增强左右滑动图片体验(图片滑动一半即可看到上一张是否选中) true or false
            .minimumCompressSize(100)// 小于100kb的图片不压缩
            .synOrAsy(true)//同步true或异步false 压缩 默认同步
            .cropWH(x,y)// 裁剪宽高比，设置如果大于图片本身宽高则无效 int
            .rotateEnabled(false) // 裁剪是否可旋转图片 true or false
            .scaleEnabled(true)// 裁剪是否可放大缩小图片 true or false
            .isDragFrame(true)// 是否可拖动裁剪框(固定)
            .forResult(PictureConfig.CHOOSE_REQUEST);//结果回调onActivityResult code
  }

  @Override
  public boolean onActivityResult(int requestCode, int resultCode, Intent data) {
    List<String> resultList = new ArrayList<>();
    if (data == null) {
      result.success(resultList);
      return true;
    }
    if (resultCode == Activity.RESULT_OK) {
      switch (requestCode) {
        case PictureConfig.CHOOSE_REQUEST:
          // 图片选择结果回调
          selectList = PictureSelector.obtainMultipleResult(data);
          // 例如 LocalMedia 里面返回三种path
          // 1.media.getPath(); 为原图path
          // 2.media.getCutPath();为裁剪后path，需判断media.isCut();是否为true
          // 3.media.getCompressPath();为压缩后path，需判断media.isCompressed();是否为true
          // 如果裁剪并压缩了，已取压缩路径为准，因为是先裁剪后压缩的
          for(int i = 0; i< selectList.size();i++) {
            System.out.println(">>>>>>>>>>>>>"+selectList.get(i));
            resultList.add(selectList.get(i).getCutPath());
          }
          break;
      }
    }
    result.success(resultList);
    return true;
  }


}
