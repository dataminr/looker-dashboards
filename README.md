# Dataminr Project
## Dataminr Looker Dashboards

## Introduction

### Dataminr is a real-time information discovery platform that leverages artificial intelligence and machine learning to identify and deliver critical information and alerts to users. The platform is designed to help organizations, including businesses, news organizations, government agencies, and other entities, detect and respond to important events and developments as they happen.

## Description

### Elevate your data-driven decision-making with Looker's powerful analytics platform tailored for the Dataminr ecosystem. Seamlessly transform raw data into actionable insights through intuitive visualizations and interactive dashboards. Harness the combined potential of Looker and Dataminr to unlock deeper insights and drive your business forward. <br><br>

## Steps for installing the Dataminr Looker Dashboard Project

## Create a connection in Looker

1. To create connection to the chronicle, First open the Looker instance and navigate to the Home page.

    ![image13](https://github.com/dataminr/looker-dashboards/assets/138869970/e0d2eeb5-6360-49db-81bf-3c3d8bc84040)

2. Now select the main menu. Then click Admin and go to the connection page.

    ![image19](https://github.com/dataminr/looker-dashboards/assets/138869970/2a182b86-aecb-44fe-8bff-f548d41c6a12)

3. Now click on the Add connection to create a new connection.
4. Enter the name of the connection as you prefer and select Google BigQuery Standard SQL in the Dialect. <br>
   Now several new fields will appear. 
5. Enter Billing Project ID field. Example: “chronicle-crds” here, where Chronicle data is present.
6. Enter the relevant dataset name, Example: “datalake” here:

    ![image11](https://github.com/dataminr/looker-dashboards/assets/138869970/29f9544b-84d2-4ca1-8abe-11c9d96adf8d)

7. For the authentication choose service account method and upload the service account file.
8. In Optional settings, Set both the timestamps (Database timestamp and query timestamp) as UTC (the time fields shown in dashboards will affect accordingly).
9. Click on the Connect button (![image4](https://github.com/dataminr/looker-dashboards/assets/138869970/1af13a95-fbc6-4c9f-a43a-7a628801e458)), and it is Done. You are connected to the Chronicle database.
    <br><br>


## Method-1: Get the Block from Github Repository

1. Go to https://github.com/monil-shah28/dataminr_looker_dashboards and fork the main branch.

2. Turn on “Development Mode”.
   
    ![image25](https://github.com/dataminr/looker-dashboards/assets/138869970/54d77cfc-5fdd-45aa-8414-d438dc49073b)

3. Select Projects from the Develop menu.

    ![image20](https://github.com/dataminr/looker-dashboards/assets/138869970/0bb522dc-65d1-4b67-a8ee-3b12198b21f5) <br><br>
    ![image34](https://github.com/dataminr/looker-dashboards/assets/138869970/86109b77-2d8d-4420-88cb-765bb3d1834e) 

4. From the LookML Projects page, select New LookML Project to open the New Project page.

    ![image9](https://github.com/dataminr/looker-dashboards/assets/138869970/376b7f85-d72b-42f9-83c7-7460801edd89)

5. On the New Project page, specify the options for project:
    a. Project Name: Give project name (i.e., dataminr-dashboards).
    b. Starting Point: Choose Blank Project.
    c. Select Create Project. Looker creates the project and opens it in the Looker IDE.

   ![image35](https://github.com/dataminr/looker-dashboards/assets/138869970/1770a449-2802-40bd-a94d-f14aaf95c474)

6. Select the Settings icon from the navigation bar, and open the Configure Git page by selecting the Configure Git button:

   ![image32](https://github.com/dataminr/looker-dashboards/assets/138869970/8184a68b-fb3c-46bb-b7aa-89759fe4bd65)
  
7. In Looker's Configure Git section, paste the HTTPS URL for dataminr looker dashboard git repository in the Repository URL field, then select Continue.

      ![image24](https://github.com/dataminr/looker-dashboards/assets/138869970/c0ed6ab4-259f-44e7-80ec-4fa3da4b6960)

8. Enter github username and Personal Access Token, then click “Test and Finalize Setup”:

      ![image36](https://github.com/dataminr/looker-dashboards/assets/138869970/56421c1d-66fc-4d92-ab14-5d53d46817ce)

9. If you get an error like “Ensure credential allow write access failed”, just enter the username and token again and click “Skip Tests and Finalize Setup”:

      ![image37](https://github.com/dataminr/looker-dashboards/assets/138869970/d9af30d6-28de-4cae-b1fd-58f1aafe79c3)


10. Now, you should be able to see the code from master branch. If not <br>
      a. In the ‘Git Actions’ tab from the left side, click on the “Pull from…” option.

    ![image17](https://github.com/dataminr/looker-dashboards/assets/138869970/6abb00a1-9a7e-4733-906b-0005b19745df)

      b. Select the “Pull From Production” option and click on the Confirm button.

    ![image14](https://github.com/dataminr/looker-dashboards/assets/138869970/6bf11405-5dbc-402c-93cb-fe57a975ba7a)

11. In the ‘File Browser’ tab from the left side, click on ‘manifest.lkml’ and update the value of the following constants and then click “Save Changes”. <br>
      a. project_name: The name of the project you provided in step 4. (i.e. dataminr-chronicle) <br>
      b. CONNECTION_NAME: The name of the connection you created to connect with the chronicle. <br>
      c. CHRONICLE_URL: The link of your chronicle tenant where the drill results will be redirected. <br>

      ![image38](https://github.com/dataminr/looker-dashboards/assets/138869970/34d6a75b-d557-493b-8e2b-1a849db8dc11)

12. In the Git Actions, click on the “Deploy to Production”:

    ![image6](https://github.com/dataminr/looker-dashboards/assets/138869970/c2fd7ff6-72f4-45ed-8389-9b3bfc75588c)

13. On the Homepage of your Looker instance, navigate to the “LookML dashboards” tab under the “Folders” tab to access and view all the created dashboards.

    ![image21](https://github.com/dataminr/looker-dashboards/assets/138869970/7a699346-9359-440c-85e0-714769ef826f)
    <br><br>


## Method-2: Get the Block from Marketplace

1. After a successful connection click on the ‘marketplace’ button in the top-right corner.

    ![image26](https://github.com/dataminr/looker-dashboards/assets/138869970/fb3bc4e2-73d9-4029-9f41-279f41685d26)

2. And then click on “Discover”.

    ![image13](https://github.com/dataminr/looker-dashboards/assets/138869970/9c29fa03-2fd1-4237-83a3-66a016e88f97)

3. It will open a Looker marketplace.

    ![image3](https://github.com/dataminr/looker-dashboards/assets/138869970/6084acef-0f3b-4a85-a3b2-241a8da951ff)

4. Search “Dataminr”, it will open the page for installation.

5. Click on “install+”.

6. Select “Install” And “Accept”  terms and conditions.

7. Click on Agree and Continue.

8. Select Connect Name from the dropdown.

9. After Successful installation, user would be able to see the Dataminr block under Home => Blocks => It would be displayed similar to the Chronicle block displayed in the image below.

    ![image16](https://github.com/dataminr/looker-dashboards/assets/138869970/6d149df9-653c-4b43-a892-0411179c990d)

10. After clicking on it, you would be able to see the below listed dashboards, that would populated Dataminr data from your configured Chronicle instance. Example, Dashboards displayed after installing the Chronicle Block.

    ![image31](https://github.com/dataminr/looker-dashboards/assets/138869970/380d168a-c63f-4b76-b8a5-8c12c184b152)



#### You can install the project by following the installation steps from any of the above described two methods.




	
 

    



