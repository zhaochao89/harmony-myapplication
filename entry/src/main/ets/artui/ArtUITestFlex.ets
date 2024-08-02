
@Component
export struct ArtUITestFlex {

  build() {
    //direction排列方向，wrap是否换行及换行方向，justifyContent设置元素在主轴方向的对齐方式
    //alignItems设置元素在交叉轴上的对齐方式
    Flex(
      {
        direction: FlexDirection.Row,
        // wrap: FlexWrap.Wrap,
        justifyContent: FlexAlign.SpaceBetween,
        alignItems: ItemAlign.Center
      }
    ){
      //flexBasis设置子元素在父容器主轴方向上的基准尺寸。如果设置了该属性，则子项占用的空间为该属性所设置的值；如果没设置该属性，那子项的空间为width/height的值。
      //flexGrow设置父容器的剩余空间分配给此属性所在组件的比例。用于分配父组件的剩余空间。
      //flexShrink当父容器空间不足时，子元素的压缩比例。
      Text('1').height(30).backgroundColor(0xF5DEB3).flexBasis(50).flexGrow(1)
      Text('2').width(100).height(40).backgroundColor(0xD2B48C)
      Text('3').width(100).height(50).backgroundColor(0xF5DEB3)
    }
    .backgroundColor(Color.Gray)
    .padding(10)
  }
}