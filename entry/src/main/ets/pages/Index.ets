import TestPage from '../components/TestRoutePage';
import { ArtUITestScroll } from '../artui/ArtUITestScroll';
import { ArtUITestStack } from '../artui/ArtUITestStack';
import { ArtUITestFlex } from '../artui/ArtUITestFlex';
import { ArtUITestRelativeContainer } from '../artui/ArtUITestRelativeContainer';
import { ArtUITestGridRow } from '../artui/ArtUITestGridRow';
import { ArtUITestMediaQuery } from '../artui/ArtUITestMediaQuery';
import { ArtUITestList } from '../artui/ArtUITestList';
import { ToDoList } from '../TodoList/ToDoList';
import { ArtUITestGrid } from '../artui/ArtUITestGrid';
import { ArtUITestSwiper } from '../artui/ArtUITestSwiper';
import { ArtUITestTabs } from '../artui/ArtUITestTabs';
import TestRoutePage from '../components/TestRoutePage';
import { ArtUITestPage } from '../artui/ArtUITestPage';
import { ArtUITestBuilderParam } from '../artui/ArtUITestBuilderParam';
import { ArtUITestWrapBuilder } from '../artui/ArtUITestWrapBuilder';
import { ArtUITestStyles } from '../artui/ArtUITestStyles';
import { ArtUITestExtend } from '../artui/ArtUITestExtend';
import { ArtUITestStateStyles } from '../artui/ArtUITestStateStyles';
import { ArtUITestAnimatableExtend } from '../artui/ArtUITestAnimatableExtend';
import { ArtUITestRequire } from '../artui/ArtUITestRequire';

let storage = LocalStorage.getShared();
//@Entry页面入口，即页面的根节点，一个页面有且仅有一个@Entry。只有被@Entry修饰的组件才可以调用页面的生命周期。
@Entry(storage)
@Component
struct Index {

  bottomRectHeight: string = AppStorage.get<Number>('bottomRectHeight') + 'px';

  build() {
    Column(){
      ArtUITestRequire()
    }
    // .margin({ bottom: this.bottomRectHeight })
  }
}
