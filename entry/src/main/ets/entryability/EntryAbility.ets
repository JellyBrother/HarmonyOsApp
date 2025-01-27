import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import UIAbility from '@ohos.app.ability.UIAbility';
import Want from '@ohos.app.ability.Want';
import window from '@ohos.window';
import { LogUtil, WindowUtils } from '@ohos/lib_utils';
import { Configuration } from '@ohos.app.ability.Configuration';

/**
 * studio点击运行安装的是卸载重新安装
 * UIAbility生命周期
 * onCreate-onWindowStageCreate-onForeground-onBackground-onWindowStageDestroy-onDestroy
 * 其余的有onNewWant（栈内唯一模式）、onConfigurationUpdate、onMemoryLevel、onWindowStageRestore
 * 页面生命周期 Entry component/common.d.ts$CustomComponent extends CommonAttribute
 * aboutToAppear-build-onPageShow-onBackPress-onPageHide(实际没有打印)-aboutToDisappear
 * 组件生命周期 Component
 * aboutToAppear-build-aboutToDisappear
 * 启动界面点击返回键销毁界面
 * aboutToAppear-build-aboutToDisappear
 * EntryAbility,  life Ability onCreate
 * EntryAbility,  life Ability onWindowStageCreate
 * EntryAbility,  life Ability onForeground
 * MainPage,      life aboutToAppear
 * MainView,      life aboutToAppear
 * MainView,      life build (这里没法日志打印实际验证，是猜测)
 * MainPage,      life build
 * MainPage,      life onPageShow
 * MainPage,      life onBackPress
 * EntryAbility,  life Ability onBackground
 * MainPage,      life aboutToDisappear
 * MainView,      life aboutToDisappear
 * EntryAbility,  life Ability onWindowStageDestroy
 * EntryAbility,  life Ability onDestroy
 * 上滑回到桌面后重新进入界面
 * EntryAbility,  life Ability onBackground
 * MainPage,      life onPageHide
 * EntryAbility,  life Ability onNewWant
 * EntryAbility,  life Ability onForeground
 * MainPage,      life onPageShow
 */
export default class EntryAbility extends UIAbility {
  private TAG: string = 'EntryAbility';

  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    LogUtil.error(this.TAG, 'life Ability onCreate');
  }

  onNewWant(want: Want, launchParams: AbilityConstant.LaunchParam): void {
    LogUtil.error(this.TAG, 'life Ability onNewWant');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    LogUtil.error(this.TAG, 'life Ability onWindowStageCreate');
    WindowUtils.init(windowStage)

    // // 1.获取应用主窗口。
    // let windowClass: window.Window | null = null;
    // windowStage.getMainWindow((err, data) => {
    //   let errCode: number = err.code;
    //   if (errCode) {
    //     LogUtil.error(this.TAG, 'Failed to obtain the main window. Cause: ' + JSON.stringify(err));
    //     return;
    //   }
    //   windowClass = data;
    //   WindowUtils.init(data)
    //   LogUtil.error(this.TAG, 'Succeeded in obtaining the main window. Data: ' + JSON.stringify(data));
    //
    //   // // 2.实现沉浸式效果。方式一：设置导航栏、状态栏不显示。
    //   // let names: Array<'status' | 'navigation'> = [];
    //   // windowClass.setWindowSystemBarEnable(names, (err) => {
    //   //   let errCode: number = err.code;
    //   //   if (errCode) {
    //   //     LogUtil.error(this.TAG, 'Failed to set the system bar to be visible. Cause:' + JSON.stringify(err));
    //   //     return;
    //   //   }
    //   //   LogUtil.error(this.TAG, 'Succeeded in setting the system bar to be visible.');
    //   // });
    //
    //   // 2.实现沉浸式效果。方式二：设置窗口为全屏布局，配合设置导航栏、状态栏的透明度、背景/文字颜色及高亮图标等属性，与主窗口显示保持协调一致。
    //   let isLayoutFullScreen = true;
    //   windowClass.setWindowLayoutFullScreen(isLayoutFullScreen, (err) => {
    //     let errCode: number = err.code;
    //     if (errCode) {
    //       Log.getInstance()
    //         .error(this.TAG, 'Failed to set the window layout to full-screen mode. Cause:' + JSON.stringify(err));
    //       return;
    //     }
    //     LogUtil.error(this.TAG, 'Succeeded in setting the window layout to full-screen mode.');
    //   });
    //   let sysBarProps: window.SystemBarProperties = {
    //     statusBarColor: '#ff00ff',
    //     navigationBarColor: '#00ff00',
    //     // 以下两个属性从API Version 8开始支持
    //     statusBarContentColor: '#ffffff',
    //     navigationBarContentColor: '#ffffff'
    //   };
    //   windowClass.setWindowSystemBarProperties(sysBarProps, (err) => {
    //     let errCode: number = err.code;
    //     if (errCode) {
    //       LogUtil.error(this.TAG, 'Failed to set the system bar properties. Cause: ' + JSON.stringify(err));
    //       return;
    //     }
    //     LogUtil.error(this.TAG, 'Succeeded in setting the system bar properties.');
    //   });
    // })

    // 3.为沉浸式窗口加载对应的目标页面。
    windowStage.loadContent('oxhorncampus/pages/Splash', (err) => {
      if (err.code) {
        LogUtil.error(this.TAG, 'Failed to load the content. Cause: ' + JSON.stringify(err));
        return;
      }
      LogUtil.error(this.TAG, 'Succeeded in loading the content.');
    });
  }

  onForeground(): void {
    LogUtil.error(this.TAG, 'life Ability onForeground');
  }

  onBackground(): void {
    LogUtil.error(this.TAG, 'life Ability onBackground');
  }

  onWindowStageDestroy(): void {
    LogUtil.error(this.TAG, 'life Ability onWindowStageDestroy');
  }

  onDestroy(): void {
    LogUtil.error(this.TAG, 'life Ability onDestroy');
  }

  ////////////////////////////////////其他方法
  onConfigurationUpdate(newConfig: Configuration): void {
    LogUtil.error(this.TAG, 'life Ability onConfigurationUpdate');
  }

  onMemoryLevel(level: AbilityConstant.MemoryLevel): void {
    LogUtil.error(this.TAG, 'life Ability onMemoryLevel');
  }

  onWindowStageRestore(windowStage: window.WindowStage): void {
    LogUtil.error(this.TAG, 'life Ability onWindowStageRestore');
  }
}
