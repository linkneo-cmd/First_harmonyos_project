import {Header} from '../components/CommonComponents'

class Person{
  name: string
  age: number
  gf: Person

  constructor(name: string, age: number, gf?: Person) {
    this.name = name
    this.age = age
    this.gf = gf
  }
}

@Entry
@Component
struct StatePage2 {
  idx: number = 1
  @State p: Person = new Person('jack', 21)
  @State gfs: Person[] = [
    new Person('柔丝',18),
    new Person('露西',19)
  ]
  build() {
    Column() {
      Header({title: '商品列表'})
        .margin({bottom: 20})
      Text(`${this.p.name} : ${this.p.age}`)
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
        .fontColor('#36D')
        .onClick(() => {
          this.p.age++
        })
      Button('添加')
        .onClick(() => {
          this.gfs.push(new Person('女友' + this.idx++, 20))
        })
      Text('=女友列表=')
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
      ForEach(
        this.gfs,
        (p, index) => {
          Row(){
            Text(`${p.name} : ${p.age}`)
              .fontSize(30)
              .fontWeight(FontWeight.Bold)
              .fontColor('#36D')
              .onClick(() => {
                this.gfs[index] = new Person(p.name, p.age + 1)
              })
            Button('删除')
              .onClick(() => {
                this.gfs.splice(index, 1)
              })
          }
          .width('100%')
          .justifyContent(FlexAlign.SpaceAround)
        }
      )
    }
    .width('100%')
    .height('100%')
    .padding(20)
  }
}

@Component
struct StatePage {
  @State name: string = 'Jack'
  @State age: number = 21

  build() {
    Row() {
      Column() {
        Text(`${this.name} : ${this.age}`)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .fontColor('#36D')
          .onClick(() => {
            this.age++
          })

        Image($r('app.media.icon'))
          .width(250)
          .interpolation(ImageInterpolation.High)
      }
      .width('100%')
    }
    .height('100%')
  }
}