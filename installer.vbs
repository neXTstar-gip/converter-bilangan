Set sh = CreateObject("WScript.Shell")
Set fso = CreateObject("Scripting.FileSystemObject")

'Download python installer
sh.Run "powershell -Command ""Invoke-WebRequest -Uri https://www.python.org/ftp/python/3.12.0/python-3.12.0-amd64.exe -OutFile python-installer.exe""", 0, true

'Install silent
sh.Run "python-installer.exe /quiet InstallAllUsers=1 PrependPath=1 Include_test=0", 0, true

'Delete installer
If fso.FileExists("python-installer.exe") Then fso.DeleteFile("python-installer.exe")

'Test python
On Error Resume Next
Set exec = sh.Exec("cmd /c python --version")
WScript.Sleep 2000

If exec.Status <> 0 Then
    'notif gagal
    sh.Run "powershell -Command ""[System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms');[System.Windows.Forms.MessageBox]::Show('Install Python gagal. Silakan install manual.','Gagal')""", 0, false
    WScript.Quit
End If

'notif sukses
sh.Run "powershell -Command ""[System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms');[System.Windows.Forms.MessageBox]::Show('Python berhasil diinstall!','Sukses')""", 0, false

'jalankan script lo di CMD normal
sh.Run "cmd /c python main.py", 1, false
