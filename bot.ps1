clear-host


#añadimos la libreria de control de modales

Add-Type -AssemblyName System.Windows.Forms


#añadimos la libreria selenium


$usuario = $env:USERNAME

Add-Type -Path "C:\Users\$usuario\Desktop\script\WebDriver.dll"




#agregamos una nueva variable de entorno


$env:PATH += ";C:\Users\$usuario\Desktop\script\"



$controlador =  New-Object -TypeName "OpenQA.Selenium.Firefox.FirefoxDriver"

$controlador.Manage().Window.Maximize();



$controlador.Navigate().GoToUrl("http://www.mejortorrent.com/torrents-de-peliculas-hd-alta-definicion.html")




$controlador.FindElementByXPath("/html/body/table/tbody/tr[3]/td/table/tbody/tr/td[2]/table/tbody/tr/td/table[2]/tbody/tr[3]/td/table/tbody/tr/td/div/center/a[2]/img").click()


$pantalla = $controlador.WindowHandles.count



if($pantalla -eq 2){

$controlador.SwitchTo().Window($controlador.WindowHandles[1]).close()



}



$controlador.SwitchTo().Window($controlador.WindowHandles[0]) | out-null


sleep 3




$controlador.FindElementByLinkText("Descargar").Click()




if($pantalla -eq 2){

$controlador.SwitchTo().Window($controlador.WindowHandles[1]).close()



}

$controlador.SwitchTo().Window($controlador.WindowHandles[0]) | out-null


sleep 4



$controlador.FindElementByLinkText("aquí").click()


sleep 1

######ACEPTAR EL CUADRO DE DIALOGO#####

[System.Windows.Forms.SendKeys]::SendWait("{DOWN}")


sleep 1

[System.Windows.Forms.SendKeys]::SendWait("{ENTER}")

sleep 3


$controlador.quit()

######NOS TRAE EL ARCHIVO AL ESCRITORIO#####

cd C:\Users\$usuario\Downloads

$pelicula = ls | Sort-Object


Move-Item  -Path $pelicula[0]  -Destination C:\Users\$usuario\Desktop  -Force


######SELECCIONAMOS ARCHIVO Y LO EJECUTAMOS########

sleep 2

Invoke-Item C:\Users\$usuario\Desktop\$pelicula

[System.Windows.Forms.SendKeys]::SendWait("{ENTER}{ENTER}")

sleep 3


[System.Windows.Forms.SendKeys]::SendWait("{ENTER}{ENTER}")

sleep 4

[System.Windows.Forms.SendKeys]::SendWait("{ESC}")

Remove-Item C:\Users\$usuario\Desktop\$pelicula


cls

write-host "------------------------------"
write-host -FOREGROUND Yellow "Completado"
write-host "------------------------------"

###fin del script
