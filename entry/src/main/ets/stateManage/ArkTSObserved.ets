/*
 * @ObjectLink和@Observed类装饰器用于在涉及嵌套对象或数组的场景中进行双向数据同步。
 * 使用@Observed装饰class会改变class原始的原型链，@Observed和其他类装饰器装饰同一个class可能会带来问题。
 * @ObjectLink装饰器不能在@Entry装饰的自定义组件中使用。
 * @ObjectLink装饰的变量不能被赋值，如果要使用赋值操作，请使用@Prop。
 * @ObjectLink只能接收被@Observed装饰class的实例，推荐设计单独的自定义组件来渲染每一个数组或对象。
 * */

//NextID是用来在ForEach循环渲染过程中，为每个数组元素生成一个唯一且持久的键值，用于标识对应的组件。
let NextID: number = 1;

@Component
export struct ArkTSObserved {
  @State user: User = new User(new Bag(0));
  @State child: Book = new Book(new BookName(0));

  build() {
    Column() {
      ViewA({ label: 'ViewA #1', bag: this.user.bag })
        .width(320)
      ViewC({ label: 'ViewC #3', bookName: this.child.bookName })
        .width(320)
      Divider()
        .strokeWidth(5)
      Button('Parent：this.child.bookName.size add 10')
        .width(320)
        .backgroundColor('#17a98d')
        .margin(10)
        .onClick(() => {
          this.child.bookName.size += 10;
        })
      Button('Parent：this.user.bag =new Bag(10)')
        .width(320)
        .backgroundColor('#17a98d')
        .margin(10)
        .onClick(() => {
          this.user.bag = new Bag(10);
        })
      Button('Parent：this.user = new User(new Bag(20))')
        .width(320)
        .backgroundColor('#17a98d')
        .margin(10)
        .onClick(() => {
          this.user = new User(new Bag(20));
        })
    }
  }
}

@Component
struct ViewA {
  label: string = 'ViewA'
  @ObjectLink bag: Bag;

  build() {
    Column() {
      Text(`ViewA [${this.label}] this.bag.size = ${this.bag.size}`)
        .fontColor(Color.White)
        .backgroundColor('#3d9dba')
        .width(320)
        .height(50)
        .borderRadius(25)
        .margin(10)
        .textAlign(TextAlign.Center)
      Button('ViewA: this.bag.size add 1')
        .width(320)
        .backgroundColor('#17a98d')
        .margin(10)
        .onClick(() => {
          this.bag.size += 1;
        })
    }
  }
}

@Component
struct ViewC {
  label: string = 'ViewC1';
  @ObjectLink bookName: BookName;

  build() {
    Row() {
      Column() {
        Text(`ViewC [${this.label}] this.bookName.size = ${this.bookName.size}}`)
          .fontColor(Color.White)
          .backgroundColor('#3d9dba')
          .width(320)
          .height(50)
          .borderRadius(25)
          .margin(10)
          .textAlign(TextAlign.Center)
        Button('ViewC: this.bookName.size add 1')
          .width(320)
          .backgroundColor('#17a98d')
          .margin(10)
          .onClick(() => {
            this.bookName.size += 1;
            console.log('this.bookName.size:' + this.bookName.size);
          })
      }
      .width(320)
    }
  }
}

@Observed
class Bag {
  public id: number;
  public size: number;

  constructor(size: number) {
    this.id = NextID++;
    this.size = size;
  }
}

@Observed
class User {
  public bag: Bag;

  constructor(bag: Bag) {
    this.bag = bag;
  }
}

@Observed
class BookName extends Bag {
  public nameSize: number;

  constructor(nameSize: number) {
    //调用父类方法对nameSize进行处理
    super(nameSize)
    this.nameSize = nameSize;
  }
}

@Observed
class Book {
  public bookName: BookName;

  constructor(bookName: BookName) {
    this.bookName = bookName
  }
}