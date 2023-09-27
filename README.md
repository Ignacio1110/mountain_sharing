# mountain_sharing

設計稿：

https://www.figma.com/file/NAYrz5kXLAowIYjFKQf2C8/Hiking-Friends-(WIP)-(Community)?node-id=0%3A1&mode=dev

第一週Youtube影片位置：

https://www.youtube.com/watch?v=7X9Dq1sBBsI&t=55s

常用指令：

用於產生程式

dart run build_runner build

mason make model --jsonFile ./posts.json

註記：Android虛擬機連線localhost問題，可以將api連結更改為10.0.2.2。

If you are using an Android emulator then localhost on the emulator is not 127.0.0.0 it is 10.0.2.2, so, on Android emulator you need to write https://10.0.2.2:8000, the https://127.0.0.1:8000 will not work on real device too. because localhost means something different on real device.