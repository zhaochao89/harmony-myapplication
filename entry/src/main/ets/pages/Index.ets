import TestPage from '../components/TestRoutePage';
import { ArkUITestScroll } from '../arkui/ArkUITestScroll';
import { ArkUITestStack } from '../arkui/ArkUITestStack';
import { ArkUITestFlex } from '../arkui/ArkUITestFlex';
import { ArkUITestRelativeContainer } from '../arkui/ArkUITestRelativeContainer';
import { ArkUITestGridRow } from '../arkui/ArkUITestGridRow';
import { ArkUITestMediaQuery } from '../arkui/ArkUITestMediaQuery';
import { ArkUITestList } from '../arkui/ArkUITestList';
import { ToDoList } from '../TodoList/ToDoList';
import { ArkUITestGrid } from '../arkui/ArkUITestGrid';
import { ArkUITestSwiper } from '../arkui/ArkUITestSwiper';
import { ArkUITestTabs } from '../arkui/ArkUITestTabs';
import TestRoutePage from '../components/TestRoutePage';
import { ArkUITestPage } from '../arkui/ArkUITestPage';
import { ArkUITestBuilderParam } from '../arkui/ArkUITestBuilderParam';
import { ArkUITestWrapBuilder } from '../arkui/ArkUITestWrapBuilder';
import { ArkUITestStyles } from '../arkui/ArkUITestStyles';
import { ArkUITestExtend } from '../arkui/ArkUITestExtend';
import { ArkUITestStateStyles } from '../arkui/ArkUITestStateStyles';
import { ArkUITestAnimatableExtend } from '../arkui/ArkUITestAnimatableExtend';
import { ArkUITestRequire } from '../arkui/ArkUITestRequire';
import { ArkTSState } from '../stateManage/ArkTSState';
import { ArkTSProp } from '../stateManage/ArkTSProp';
import { ArkTSLink } from '../stateManage/ArkTSLink';
import { ArkTSProvide } from '../stateManage/ArkTSProvide';
import { ArkTSObserved } from '../stateManage/ArkTSObserved';
import { ArkTSWatch } from '../stateManage/ArkTSWatch';
import { ArkTS$$ } from '../stateManage/ArkTS$$';
import { ArkTSTrack } from '../stateManage/ArkTSTrack';
import { ArkUILazyForEach } from '../arkui/ArkUILazyForEach';
import { ArkTSPromise } from '../arkTS/ArkTSPromise';
import { ArkTSTaskPool } from '../arkTS/ArkTSTaskPool';
import { TestHttp } from '../network/HttpRequest';

let storage = LocalStorage.getShared();
//@Entry页面入口，即页面的根节点，一个页面有且仅有一个@Entry。只有被@Entry修饰的组件才可以调用页面的生命周期。
@Entry(storage)
@Component
struct Index {

  bottomRectHeight: string = AppStorage.get<Number>('bottomRectHeight') + 'px';

  build() {
    Column(){
      TestHttp()
    }
    // .margin({ bottom: this.bottomRectHeight })
  }
}
