import { AbilityConstant, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
  }

  onDestroy(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');

    windowStage.loadContent('navigation/NavigationExamplePage', (err) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content.');
      //获取应用窗口
      let windowClass: window.Window = windowStage.getMainWindowSync();
      //1、设置窗口全屏
      let isLayoutFullScreen = true;
      // windowClass.setWindowLayoutFullScreen(isLayoutFullScreen)
      //   .then(() => {
      //     console.info('Succeeded in setting the window layout to full-screen mode.');
      //   })
      //   .catch((err: BusinessError) => {
      //     console.error('Failed to set the window layout to full-screen model. Cause:' + JSON.stringify(err));
      //   })
      //2、获取布局避让遮挡的区域
      let type = window.AvoidAreaType.TYPE_NAVIGATION_INDICATOR; //导航条避让
      let avoidArea = windowClass.getWindowAvoidArea(type);
      let bottomRectHeight = avoidArea.bottomRect.height; //获取导航条区域的高度
      AppStorage.setOrCreate('bottomRectHeight', bottomRectHeight);
      //3、设置状态栏和导航条隐藏
      windowClass.setSpecificSystemBarEnabled('navigationIndicator', false)
        .then(() => {
          console.info('Succeeded in setting the navigationIndicator to be invisible.')
        })
        .catch((err: BusinessError) => {
          console.error(`Failed to set the navigationIndicator to be invisible. Code is ${err.code}, message is ${err.message}.`)
        })
      // windowClass.setSpecificSystemBarEnabled('status', false)
      //   .then(() => {
      //     console.info('Succeeded in setting the navigationIndicator to be invisible.')
      //   })
      //   .catch((err: BusinessError) => {
      //     console.error(`Failed to set the navigationIndicator to be invisible. Code is ${err.code}, message is ${err.message}.`)
      //   })
      //4、设置窗口的背景颜色
      windowClass.setWindowBackgroundColor('#f1f2f5')
    });
  }

  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground(): void {
    // Ability has brought to foreground
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
  }

  onBackground(): void {
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }
}
