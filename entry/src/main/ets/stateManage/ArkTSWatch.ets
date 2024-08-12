
@Component
export struct ArkTSWatch {
  @State count: number = 0;

  build() {
    Column({ space: 30 }) {
      Button('add to basket')
        .onClick(() => {
          this.count++;
        })
      TotalView({ count: this.count })

      BasketModifier();
    }
  }
}

@Component
struct TotalView {
  @Prop @Watch('onCountUpdated') count: number = 0;
  @State total: number = 0;

  onCountUpdated(propName: string): void {
    this.total += this.count;
  }

  build() {
    Text(`Total: ${this.total}`)
  }
}

@Component
struct BasketModifier {
  @State shopBasket: PurchaseItem[] = [];

  build() {
    Column() {
      Button('Add to basket')
        .onClick(() => {
          this.shopBasket.push(new PurchaseItem(Math.round(100 * Math.random())));
        })
      BasketViewer({ shopBasket: $shopBasket})
    }
  }
}

@Component
struct BasketViewer {
  @Link @Watch('onBasketUpdated') shopBasket: PurchaseItem[];
  @State totalPurchase: number = 0;

  updateTotal() {
    let total = this.shopBasket.reduce((sum, i) => sum + i.price, 0);
    if (total >= 100) {
      total = 0.9 * total;
    }
    return total;
  }

  onBasketUpdated(propName: string) {
    this.totalPurchase = this.updateTotal();
  }

  build() {
    Column({ space: 30 }) {
      ForEach(this.shopBasket, (item: PurchaseItem) => {
        Text(`Price: ${item.price.toFixed(2)}$`)
      }, (item: PurchaseItem) => item.id.toString())
      Text(`Total: ${this.totalPurchase.toFixed(2)}$`)
    }
  }
}

class PurchaseItem {
  static NextId: number = 0;
  public id: number;
  public price: number;

  constructor(price: number) {
    this.price = price;
    this.id = PurchaseItem.NextId++;
  }
}