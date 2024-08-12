@Component
export struct ArkTSTrack {
  @State logTrack: LogTrack = new LogTrack('Hello');
  @State logNotTrack: LogNotTrack = new LogNotTrack('你好');

  isRender(index: number) {
    console.log(`+++++Text ${index} is rendered`);
    return 50;
  }

  build() {
  Row() {
    Column() {
      Text(this.logTrack.str1)
        .fontSize(this.isRender(1))
        .fontWeight(FontWeight.Bold)
      Text(this.logTrack.str2)
        .fontSize(this.isRender(2))
        .fontWeight(FontWeight.Bold)
      Button('change logTrack.str1')
        .onClick(() => {
          this.logTrack.str1 = 'Bye';
        })
      Text(this.logNotTrack.str1)
        .fontSize(this.isRender(3))
        .fontWeight(FontWeight.Bold)
      Text(this.logNotTrack.str2)
        .fontSize(this.isRender(4))
        .fontWeight(FontWeight.Bold)
      Button('change logNotTrack.str1')
        .onClick(() => {
          this.logNotTrack.str1 = '再见';
        })
    }
    .width('100%')
  }
  .height('100%')
  }
}

class LogTrack {
  @Track str1: string;
  @Track str2: string;

  constructor(str1: string) {
    this.str1 = str1;
    this.str2 = 'World';
  }
}

class LogNotTrack {
  str1: string;
  str2: string;

  constructor(str1: string) {
    this.str1 = str1;
    this.str2 = '世界';
  }
}