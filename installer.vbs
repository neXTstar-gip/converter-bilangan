' === auto-python.vbs ===
Option Explicit
Dim objShell, objFSO, exitCode, installer, downloadURL, tempPath, savePath

Set objShell = CreateObject("WScript.Shell")
Set objFSO = CreateObject("Scripting.FileSystemObject")

' Lokasi installer
downloadURL = "https://www.python.org/ftp/python/3.12.5/python-3.12.5-amd64.exe"
tempPath = objShell.ExpandEnvironmentStrings("%TEMP%")
savePath = tempPath & "\python-installer.exe"

' Cek Python
exitCode = objShell.Run("cmd /c python --version", 0, True)

If exitCode = 0 Then
    objShell.Run "cmd /k python script.py", 1, True
Else
    ' Download Python installer
    If Not objFSO.FileExists(savePath) Then
        DownloadFile downloadURL, savePath
    End If
    
    ' Install Python silent (Add to PATH, no GUI)
    exitCode = objShell.Run("""" & savePath & """ /quiet InstallAllUsers=1 PrependPath=1 Include_test=0", 1, True)
    
    If exitCode = 0 Then
        objShell.Popup "✅ Python berhasil diinstall bro!", 5, "Installer", 64
        objShell.Run "cmd /k python script.py", 1, True
    Else
        objShell.Popup "❌ Gagal install Python, coba install manual ya.", 5, "Installer Error", 16
    End If
End If

' === Function download file via MSXML2.XMLHTTP ===
Sub DownloadFile(URL, SaveTo)
    Dim objHTTP, objStream
    Set objHTTP = CreateObject("MSXML2.XMLHTTP")
    objHTTP.Open "GET", URL, False
    objHTTP.Send
    If objHTTP.Status = 200 Then
        Set objStream = CreateObject("ADODB.Stream")
        objStream.Open
        objStream.Type = 1
        objStream.Write objHTTP.ResponseBody
        objStream.SaveToFile SaveTo, 2
        objStream.Close
    End If
End Sub
