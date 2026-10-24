import router from '@ohos.router'

PersistentStorage.PersistProp('count', 0);

@Entry
@Component
struct Index {
    @StorageLink('count') count: number = 0

    build() {
        Column({ space: 40 }) {
            // 应用退出时会保存当前结果。重新启动后，会显示上一次的保存结果
            Text(`${this.count}`)
                .onClick(() => {
                    this.count ++;
                })
                .fontSize(50)

            Button('开关灯')
                .fontSize(18)
                .width(160)
                .backgroundColor('#FF9500')
                .onClick(() => {
                    router.pushUrl({ url: 'light/LightPage' })
                })
        }
        .width('100%')
        .height('100%')
        .justifyContent(FlexAlign.Center)
    }
}
