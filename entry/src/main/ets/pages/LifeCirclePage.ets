import { Header } from '../components/CommonComponents'

@Entry
@Component
struct LifeCirclePage {
  @State show: boolean = false
  @State arr: string[] = []

  tag: string = 'Life Circle Page'

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
    Column({space: 20}) {
      // 顶部标题
      Header({ title: '测试组件生命周期' })

      // 按钮
      Button('切换显示')
        .onClick(() => this.show = !this.show)

      Row(){
        if(this.show){
          MyText({message: 'Hello World!'})
        }
      }
      .height(30)

      // 新增按钮
      Button('新增数据')
        .onClick(() => this.arr.push('user_' + this.arr.length))
      ForEach(this.arr, (item, index) => {
        MyText({ message: item, index: index, delete: this.delete.bind(this) })
      })
    }
    .width('100%')
    .height('100%')
  }
  delete(index: number = -1){
    if(index > -1){
      this.arr.splice(index, 1)
    }
  }
}

@Component
struct MyText {
  message: string
  index?: number
  delete?: (index: number) => void


  tag: string = 'MyText Page'

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
    Row(){
      Text(this.message)
        .fontSize(20)
      if(this.delete){
        Image($r('app.media.ic_public_delete'))
          .width(20)
          .onClick(() => this.delete(this.index))
      }
    }
    .width('100%')
    .justifyContent(FlexAlign.SpaceAround)
  }
}