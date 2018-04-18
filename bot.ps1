clear-host

#añadimos la libreria selenium

Add-Type -Path "C:\Users\ortiga\Desktop\script\WebDriver.dll"


#seleccionamos la ruta de la aplicacion que nos va a levantar google crome especifico de selenium


$env:PATH += ";N:\selenium"



$controlador =  New-Object -TypeName "OpenQA.Selenium.Chrome.ChromeDriver"

$controlador.Manage().Window.Maximize();



$controlador.Navigate().GoToUrl("http://www.mejortorrent.com/torrents-de-peliculas-hd-alta-definicion.html")




$controlador.FindElementByXPath("/html/body/table/tbody/tr[3]/td/table/tbody/tr/td[2]/table/tbody/tr/td/table[3]/tbody/tr[3]/td/table/tbody/tr/td/div/center/a[1]").click()

$controlador.SwitchTo().Window($controlador.WindowHandles[0])




$controlador.FindElementByLinkText("Descargar").click()



$controlador.SwitchTo().Window($controlador.WindowHandles[0])

$controlador.FindElementByLinkText("aquí").click()


Clear-Host
sleep 3

Set-Location C:\Users\ortiga\Downloads

$pelicula = ls | Sort-Object

Move-Item  -Path $pelicula[0]  -Destination C:\Users\ortiga\Desktop  -Force



$controlador.quit()




