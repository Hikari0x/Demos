@Entry
@Component
struct LightPage {
  @State isOn: boolean = false

  build() {
    Column({ space: 40 }) {
      Text(this.isOn ? '灯已开启' : '灯已关闭')
        .fontSize(26)
        .fontWeight(FontWeight.Bold)
        .fontColor(this.isOn ? '#FF9500' : '#999999')

      if (this.isOn) {
        Image('light/practice/images/img_light.png')
          .width('80%')
          .borderRadius(20)
      } else {
        Image('light/practice/images/img_dark.png')
          .width('80%')
          .borderRadius(20)
      }

      Button({ type: ButtonType.Circle }) {
        Image('light/practice/images/icon_switch.png')
          .width(40)
          .height(40)
      }
      .width(80)
      .height(80)
      .backgroundColor('#333333')
      .shadow({
        radius: 10,
        color: this.isOn ? '#66FF9500' : '#66000000',
        offsetX: 0,
        offsetY: 4
      })
      .onClick(() => {
        this.isOn = !this.isOn
      })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}
