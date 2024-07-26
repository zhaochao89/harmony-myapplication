export function test() {
  const res1 = test3();
  console.warn(`+++++${res1}`);
  const res2 = do_action(Math.sin);
  console.warn(`+++++${res2}`);
  const p = new Person('zhang', 'san');
  console.warn(`+++++${p.fullName()}`);
  Person.numberOfPersons = 10;
  console.warn(`+++++${Person.numberOfPersons}`);
  console.warn(`+++++${map['John']}`);
}

//函数可选参数的两种方式：
function test1(x: string, y?: string, z: number = 3): string {
  return '';
}
//函数的最后一个参数可以是rest参数。使用rest参数时，允许函数或方法接受任意数量的实参。
function test2(...numbers: number[]): number {
  let res = 0;
  for (const n of numbers) {
    res += n;
  }
  return res;
}

function test3() {
  return '如果可以从函数体内推断出函数返回类型，则可在函数声明中省略标注返回类型。'
}

//函数作为类型一般用于回调
type trigFunc = (x: number) => number

function do_action(f: trigFunc) {
  return f(3.141592653589); //调用函数
}

//类
class Person {
  // 实例字段
  name: string = '';
  surname: string | null;

  private p1: string = 'private';
  protected p2: string = 'protected';

  // 静态字段
  static numberOfPersons = 0;

  constructor(n: string, sn: string) {
    this.name = n;
    this.surname = sn;
  }

  fullName() {
    return this.name + ' ' + this.surname;
  }
}
//使用implements可以实现多接口，包含implements子句的类必须实现列出的接口中定义的所有方法，但使用默认实现定义的方法除外。
interface DateInterface {
  now(): string;
}

class MyDate implements DateInterface {
  now(): string {
    return 'Now';
  }
}

class Employee extends Person {
  age: number = 0;

  constructor(name: string, surname: string, age: number) {
    super(name, surname);
    this.age = age;
  }
  //private修饰的成员不能在声明该成员的类之外访问
  //protected修饰符的作用与private修饰符非常相似，不同点是protected修饰的成员允许在派生类中访问
  work() {
    let n = this.name;
    // let p1 = this.p1;
    let p2 = this.p2;
  }
}
//接口也可以继承其他接口
interface Style {
  color: string
}

interface ExtendedStyle extends Style {
  width: number
}

class StyledRectangle implements ExtendedStyle {
  width: number = 0;
  color: string = '';
}

//Record: 对象类型
let map: Record<string, number> = {
  'John': 25,
  'Mary': 21
}

//泛型类型和函数
class CustomStack<Element> {
  public push(e: Element): void {

  }
}

let s = new CustomStack<number>();
s.push(123);
//泛型类型的参数还可以被限制只取某些特定的值
class CustomStack1<T extends Style> {
  public push(e: T) {

  }
}
let c = new CustomStack1<StyledRectangle>();
c.push(new StyledRectangle());