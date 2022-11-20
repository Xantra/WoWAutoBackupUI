# Xantra's AutoBackupUI Script

This script will compress your WTF folder in a ZIP file and put in on your desktop, it only keeps the 4 most recent backups.

## Setting the Script up

Step 1
---
[Download the latest .ps1 released script.](https://github.com/Xantra/WoWAutoBackupUI/releases/tag/Release)

Step 2
---
Press **Win** and search for "Task Scheduler", press **Enter**.
In the right panel choose **Create Task...**

![Image](https://i.imgur.com/lMrqkAm.png)

Step 3
---
Name it as you like and make sure that the box **"Run with highest privileges"** is **ticked**

![Image](https://i.imgur.com/t92r8X0.png)

Step 4
---
Go to the **Triggers** tab and click on **New**.
The following configuration will run the script every **Tuesday at 8:30 PM**. I like it because it's right before reset and a potential **update** of the game which may cause UI configurations loss.
Feel free to change according do your likings.

![Image](https://i.imgur.com/I2ZyMWn.png)

Step 5
---
Go to the **Actions** tab click on **New**. Choose **Start a program** in the **Action** dropdown and type **powershell** in the **Program/script** textbox.
In **Add Arguments**: 
* -File, type the path where you downloaded the script (Put it somewhere you will not delete it by accident).
* -PathLetter, type the Drive Letter where your WoW folder lives, I have it on a seperate SSD which has the letter E assigned to it.

![Image](https://i.imgur.com/yiYamUi.png)

* -WowType, type "Retail" or "Classic" depending on which UI you want to backup.

*Example of my configuration* `-File C:\Users\Antoine\Downloads\WoWBackupAutoScript.ps1 -PathLetter "E" -WowType "Retail"`

![Image](https://i.imgur.com/xA1mjW9.png)

*Note: If you want to backup both you need to create a seperate task with the different WowType parameter.*

Step 6
---

Copy the settings on the screenshot.

![Image](https://i.imgur.com/lK1pB9R.png)

**Ccongratulations you are done!**



