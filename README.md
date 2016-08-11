## 使用方式
----
0. 匯出sketch圖檔
1. 將images_convert.sh檔案複製到sketch切圖匯出的資料夾目錄下。(圖1)
2. 開啟Mac terminal並cd至該資料夾下
3. 輸入 sh ./images_convert.sh 執行
4. 完成

## 使用情境         
----

將圖片從sketch匯出時，可以選取surfix為@2x, @3x跟原本的一倍大小三種切圖進行匯出。
而@1x, @2x, @3x 是iOS開發人員所需要的特殊命名，並不適用於Android開發人員，此外，在圖片的命名中也會存在大小寫混用、空白字元、特殊符號...等，這些情況都會讓Android開發人員匯入圖檔時產生錯誤。

使用本script可以自動化將@1x, @2x, @3x圖轉換成符合規定的命名並放入相對應的mdpi, xhdpi, xxhdpi資料夾中。

簡單舉例就是把

xxx.png, xxx@2x.png, xxx@3x.png

轉換成

mdpi/xxx.png, xhdpi/xxx.png, xxhdpi/xxx.png

過程中會進行：
1.消除空白字元
2.踢除特殊字元並以下底線取代
3.將大寫字全轉換小寫字命名

ps.不支援中英文命名轉換 => 盡量要求之後以英文命名
ps2.若轉換過程中出現錯誤訊息(字符判斷的bug，不影響主要功能)，可以重複執行一次，就可以成功轉換。
