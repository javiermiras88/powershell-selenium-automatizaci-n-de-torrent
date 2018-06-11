clear-host


#añadimos la libreria de control de modales

Add-Type -AssemblyName System.Windows.Forms


#añadimos la libreria selenium

$u =  whoami

$usuario = $u.split("\")[1]

Add-Type -Path "C:\Users\$usuario\Desktop\script\WebDriver.dll"




#seleccionamos la ruta de la aplicacion que nos va a levantar google crome especifico de selenium


$env:PATH += ";N:\selenium"



$controlador =  New-Object -TypeName "OpenQA.Selenium.Firefox.FirefoxDriver"

$controlador.Manage().Window.Maximize();



$controlador.Navigate().GoToUrl("http://www.mejortorrent.com/torrents-de-peliculas-hd-alta-definicion.html")




$controlador.FindElementByXPath("/html/body/table/tbody/tr[3]/td/table/tbody/tr/td[2]/table/tbody/tr/td/table[3]/tbody/tr[3]/td/table/tbody/tr/td/div/center/a[1]").click()

$controlador.SwitchTo().Window($controlador.WindowHandles[0])




$controlador.FindElementByLinkText("Descargar").click()



$controlador.SwitchTo().Window($controlador.WindowHandles[0])

$controlador.FindElementByLinkText("aquí").click()


sleep 1


######ACEPTAR EL CUADRO DE DIALOGO#####

[System.Windows.Forms.SendKeys]::SendWait("{DOWN}")

sleep 1

[System.Windows.Forms.SendKeys]::SendWait("{ENTER}")

sleep 4

$controlador.quit()

######NOS TRAE EL ARCHIVO AL ESCRITORIO#####

cd C:\Users\$usuario\Downloads

$pelicula = ls | Sort-Object


Move-Item  -Path $pelicula[0]  -Destination C:\Users\$usuario\Desktop  -Force


######SELECCIONAMOS ARCHIVO Y LO EJECUTAMOS########

sleep 2

Invoke-Item C:\Users\$usuario\Desktop\$pelicula

[System.Windows.Forms.SendKeys]::SendWait("{ENTER}{ENTER}")

sleep 5

[System.Windows.Forms.SendKeys]::SendWait("{ENTER}{ENTER}")

sleep 10



Remove-Item C:\Users\$usuario\Desktop\$pelicula




write-host "completado"


###fin del script

