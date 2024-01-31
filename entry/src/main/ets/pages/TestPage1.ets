import router from '@ohos.router'
@Entry
@Component
struct TestPage1 {
  @State show: boolean = false
  tag: string = 'TestPage1'

  aboutToAppear(){
    console.log(this.tag, 'about to appear')
  }

  onPageShow(){
    console.log(this.tag, 'on page show')
  }

  onBackPress(){
    console.log(this.tag, 'on back press')
  }

  onPageHide(){
    console.log(this.tag, 'on page hide')
  }

  aboutToDisappear(){
    console.log(this.tag, 'about to disappear')
  }

  build() {
    Row() {
      Column({space: 20}) {
        Text(this.tag)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)

        Row(){
          Button('push page2')
            .onClick(() => {
              router.pushUrl({
                url: 'pages/TestPage2'
              })
            })
          Button('replace page2')
            .onClick(() => {
              router.replaceUrl({
                url: 'pages/TestPage2'
              })
            })
        }
        .width('100%')
        .justifyContent(FlexAlign.SpaceAround)
      }
      .width('100%')
    }
    .height('100%')
  }
}