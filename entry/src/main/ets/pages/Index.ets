import TestPage from '../components/TestRoutePage';
import { ArtUITestScroll } from '../artui/ArtUITestScroll';
import { ArtUITestStack } from '../artui/ArtUITestStack';
import { ArtUITestFlex } from '../artui/ArtUITestFlex';
import { ArtUITestRelativeContainer } from '../artui/ArtUITestRelativeContainer';
import { ArtUITestGridRow } from '../artui/ArtUITestGridRow';
import { ArtUITestMediaQuery } from '../artui/ArtUITestMediaQuery';
import { ArtUITestList } from '../artui/ArtUITestList';

@Entry
@Component
struct Index {
  build() {
    Column(){
      ArtUITestList()
    }
  }
}
