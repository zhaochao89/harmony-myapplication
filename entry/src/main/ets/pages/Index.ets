import TestPage from '../components/TestRoutePage';
import { ArtUITestScroll } from '../artui/ArtUITestScroll';
import { ArtUITestStack } from '../artui/ArtUITestStack';
import { ArtUITestFlex } from '../artui/ArtUITestFlex';
import { ArtUITestRelativeContainer } from '../artui/ArtUITestRelativeContainer';

@Entry
@Component
struct Index {
  build() {
    Column(){
      ArtUITestRelativeContainer()
    }
  }
}
