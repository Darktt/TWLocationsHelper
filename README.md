TWLocationsHelper
=================

台灣縣市地區郵遞區號查詢

* `TWCity` 代表縣市資料，有名稱及城市編號。
* `TWDistrict` 代表區域資料，有名稱, 區域編號, 城市編號, 郵遞區號。

##Usage
查詢所有縣市資料

```Objective-C 
[TWLocationsHelper getAllCitiesData]
```

查詢指定縣市中的區域資料

```Objective-C 
[TWLocationsHelper getDistDataWithCityID:<#(NSInteger)#>]
```

##Note
* ARC，非ARC專案麻煩使用`-fno-objc-arc`[教學](http://stackoverflow.com/questions/6646052/how-can-i-disable-arc-for-a-single-file-in-a-project)
* 資料至少是99年縣市合併後的版本。