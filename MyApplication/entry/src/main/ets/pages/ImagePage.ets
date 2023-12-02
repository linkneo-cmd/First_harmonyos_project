@Entry
@Component
struct Index {
  @State imageWidth: number = 150

  build() {
    Column() {
      Row(){
        Image($r('app.media.icon'))
          .width(this.imageWidth)
      }
      .width('100%')
      .height(400)
      .justifyContent(FlexAlign.Center)

      Row(){
        Text($r('app.string.width_label'))
          .fontSize(20)
          .fontWeight(FontWeight.Bold)

        TextInput({text: this.imageWidth.toFixed(0)})
          .width(150)
          .backgroundColor('#FFF')
          .type(InputType.Number)
          .onChange((value) => {
            if(value){
              this.imageWidth = parseInt(value)
            }
            console.log(value)
          })
      }
      .width('100%')
      .padding({left: 14, right: 14})
      .justifyContent(FlexAlign.SpaceBetween)

      Divider()
        .width('91%')

      Row(){
        Button('缩小')
          .width(80)
          .fontSize(20)
          .onClick(() => {
            if(this.imageWidth >= 10){
              this.imageWidth -= 10
            }
          })

        Button('放大')
          .width(80)
          .fontSize(20)
          .onClick(() => {
            if(this.imageWidth < 300){
              this.imageWidth += 10
            }
          })
      }
      .width('100%')
      .margin({top: 35, bottom: 35})
      .justifyContent(FlexAlign.SpaceEvenly)

      Slider({
        min:100,
        max:300,
        value: this.imageWidth,
        step: 10
      })
        .width('100%')
        .blockColor('#36D')
        .trackThickness(7)
        .showTips(true)
        .onChange((value) => {
          this.imageWidth = value
        })
    }
    .width('100%')
    .height('100%')
  }
}