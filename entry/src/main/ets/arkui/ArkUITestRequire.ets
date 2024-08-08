
/*
 * @Require装饰器仅用于装饰struct内的@Prop、@State、@Provide、@BuilderParam和普通变量(无状态装饰器修饰的变量)。
 * @Require装饰器修饰的，在构造时必须传参。
 * */
@Component
export struct ArkUITestRequire {
  @State message: string = 'Hello World';

  @Builder
  buildTest() {
    Row(){
      Text('Hello, World')
        .fontSize(30)
    }
  }

  build() {
    Row() {
      Child({ regular_value: this.message, state_value: this.message, provide_value: this.message, initMessage: this.message,
        message: this.message, buildTest: this.buildTest, initBuildTest: this.buildTest });
    }
  }
}

@Component
struct Child {
  @Require regular_value: string = 'Hello';
  @Require @State state_value: string = 'Hello';
  @Require @Provide provide_value: string = 'Hello';
  @Require @BuilderParam buildTest: () => void = this.buildFunction;
  @Require @BuilderParam initBuildTest: () => void = this.buildFunction;
  @Require @Prop initMessage: string = 'Hello';
  @Require @Prop message: string;

  @Builder
  buildFunction() {
    Column(){
      Text('initBuilderParam').fontSize(30)
    }
  }

  build() {
    Column({ space: 20 }) {
      Text(this.initMessage)
        .fontSize(30)
      Text(this.message)
        .fontSize(30)
      this.initBuildTest();
      this.buildTest();
    }
    .width('100%')
    .height('100%')
  }
}