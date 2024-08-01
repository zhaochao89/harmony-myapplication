import TestPage from '../components/TestRoutePage';
import { ArtUITestScrollPage } from '../artui/ArtUITestScrollPage';

@Entry
@Component
struct Index {
  build() {
    Column(){
      ArtUITestScrollPage()
    }
  }
}
