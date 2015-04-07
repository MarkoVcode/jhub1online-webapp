# Building Project #


# Introduction #

There are three essential tools that are needed to start developing the project.
Platform independent ones:
  1. [Dart IDE](https://www.dartlang.org/)
  1. [SoapUI](http://www.soapui.org/)
And [Subversion](http://subversion.apache.org/) client which can be different depending on the platform and personal preferences.

Windows users might go for [TortoiseSVN](http://tortoisesvn.net/) when the Linux lovers would rather prefer raw command line interface.

The screen grabs are from early stage of the project. The real views might differ.

**PLEASE NOTE:** _The following setup is using two ports: 8080 for local web server and 8081 for mocking REST services. Make sure the ports are not used by other software or change the configuration accordingly_

# Checking out the project #

## Linux ##
To install [Subversion](http://subversion.apache.org/) follow the way most suitable for your linux distro.
For Ubuntu you need to:
```
sudo apt-get install subversion
```
Create folder that will contain all the project's elements:
```
mkdir JHUB1OnlineProject
cd JHUB1OnlineProject
```
Check out the source files:
```
svn co https://jhub1online-webapp.googlecode.com/svn/trunk/webapp JHUB1OnlineWebApp
```

## Windows ##
  * Create a folder on your **C:\** drive or where it is convenient for you. Example: **C:\SVN**
  * Open the folder and right click within  the empty folder
  * Select **SVN Checkout...** from the dropdown
![https://jhub1online-webapp.googlecode.com/svn/wiki/assets/Win-svn_checkout-1.png](https://jhub1online-webapp.googlecode.com/svn/wiki/assets/Win-svn_checkout-1.png)

<br>

<ul><li>Type in /or copy and paste the repository URL. <i>(Tip: Ctrl+C repository URL before this step. The URL will be shown in <b>URL of repository</b> input)</i>
<pre><code>  https://jhub1online-webapp.googlecode.com/svn/trunk/webapp<br>
</code></pre>
</li><li>Navigate to your checkout directory. In this example <b>C:\SVN</b>
</li><li>Click <i>OK</i>
<img src='https://jhub1online-webapp.googlecode.com/svn/wiki/assets/Win-svn_checkout-2.png' /></li></ul>

<br>

<ul><li>Following these steps should lead to <i>Checkout Finished</i>.<br>
<img src='https://jhub1online-webapp.googlecode.com/svn/wiki/assets/Win-svn-repo_cretead-1.png' /></li></ul>

<br>

<ul><li>Check the files within the checkout folder - <b>C:\SVN</b>. They should have <b><i>green</i></b> checkout icons displayed.<br>
<img src='https://jhub1online-webapp.googlecode.com/svn/wiki/assets/Win-svn-repo_created-2.png' /></li></ul>

<br>


<h1>Configuring REST mocking service</h1>

<ul><li>(Step 1) Open SoapUI; File -> Import Remote Project<br>
<img src='https://jhub1online-webapp.googlecode.com/svn/wiki/assets/linuxWebAppDev00.png' />
</li><li>(Step 2) Provide following URL:<br>
<pre><code>https://jhub1online-webservice.googlecode.com/svn/trunk/webend/mock/REST-Project-1-soapui-project.xml<br>
</code></pre>
<img src='https://jhub1online-webapp.googlecode.com/svn/wiki/assets/linuxWebAppDev01.png' />
</li><li>(Step 3) Now the workspace is loaded, can be browsed<br>
<img src='https://jhub1online-webapp.googlecode.com/svn/wiki/assets/linuxWebAppDev03.png' />
</li><li>(Step 4) Find MockAPIOperations and in the context menu pick Start Minimized<br>
At this point the RESTful web service is waiting for the calls from the DART app.</li></ul>

<img src='https://jhub1online-webapp.googlecode.com/svn/wiki/assets/linuxWebAppDev04.png' />

<h1>Running project in DART IDE</h1>

<ul><li>(Step 1) Open Dart IDE and in the Files window context menu pick Open Existng Folder...<br>
<img src='https://jhub1online-webapp.googlecode.com/svn/wiki/assets/linuxWebAppDev10.png' />
</li><li>(Step 2) Show the path to the folder that has been just checked out JHUB1OnlineWebApp<br>
<img src='https://jhub1online-webapp.googlecode.com/svn/wiki/assets/linuxWebAppDev11.png' />
</li><li>(Step 3) You can see the project in the IDE<br>
<img src='https://jhub1online-webapp.googlecode.com/svn/wiki/assets/linuxWebAppDev12.png' />
</li><li>(Step 4) Go to RUN -> Manage Launches...<br>
<img src='https://jhub1online-webapp.googlecode.com/svn/wiki/assets/linuxWebAppDev13.png' />
</li><li>(Step 5) Create a new Browser launch<br>
<img src='https://jhub1online-webapp.googlecode.com/svn/wiki/assets/linuxWebAppDev14.png' />
</li><li>(Step 6) Select HTML file<br>
<img src='https://jhub1online-webapp.googlecode.com/svn/wiki/assets/linuxWebAppDev15.png' />
</li><li>(Step 7) It should be jhub1onlinerestexample.html and now you can press Run on the window from step 6<br>
<img src='https://jhub1online-webapp.googlecode.com/svn/wiki/assets/linuxWebAppDev16.png' />
</li><li>(Step 8) The browser should open with the following page:</li></ul>

<b>PLEASE NOTE:</b> <i>It might take a few seconds to start operating at the first time</i>

<img src='https://jhub1online-webapp.googlecode.com/svn/wiki/assets/linuxWebAppDev17.png' />