# web_security_0302
以社長大大（a.k.a 助教）給的那份git repository為基礎做修改 
 
原本登入畫面（login.php）可以用以下方法達到sql injection 
user打"' or '1' = '1' -- " 
password隨便打 

經由查詢，似乎可以透過寫 PROCEDURE 的方式來避免 
因此我就寫了一個以 user 與 password 為參數的 function 
然後上述的 sql injection 就失效了 

不過，我後來想想，這樣還是有 sql injection，因為還是使用串接字串 
user打"admin', '12') or 1; --" 
password隨便打 
就又打出sql injection了，蒸蚌 

後來上網查 owasp ，網站上表示要使用 php POD object 才可以比較好的阻絕 sql injection 
不過我還有其他課的進度 
所以就先這樣，之後再試試看ㄅ 

目前網頁已經能夠登入（使用session）、上傳照片，看留言與貼留言等功能 

檔案上傳還沒寫好 
BB Code 也還沒 
