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

let storage = LocalStorage.getShared();

@Entry(storage)
@Component
struct Index {

  bottomRectHeight: string = AppStorage.get<Number>('bottomRectHeight') + 'px';

  build() {
    Column(){
      ToDoList()
    }
    // .margin({ bottom: this.bottomRectHeight })
  }
}
