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

1. Go to this [dataminr/looker-dashboards](https://github.com/dataminr/looker-dashboards) github repository and fork this repository.

2. Go to Looker Instance and Turn on “Development Mode”.
   
    ![image25](https://github.com/dataminr/looker-dashboards/assets/138869970/54d77cfc-5fdd-45aa-8414-d438dc49073b)

3. Select Projects from the Develop menu.

    ![image20](https://github.com/dataminr/looker-dashboards/assets/138869970/0bb522dc-65d1-4b67-a8ee-3b12198b21f5) <br><br>
    ![image34](https://github.com/dataminr/looker-dashboards/assets/138869970/86109b77-2d8d-4420-88cb-765bb3d1834e) 

4. From the LookML Projects page, select New LookML Project to open the New Project page.

    ![image9](https://github.com/dataminr/looker-dashboards/assets/138869970/376b7f85-d72b-42f9-83c7-7460801edd89)

5. On the New Project page, specify the options for project:
    1. Project Name: **dataminr_project** (as the custom visualization uses dataminr_project name to be accessed e.g. dataminr_project::cyber_viz)
    2. Starting Point: Select Blank Project.
    3. Select Create Project. Looker creates the project and opens it in the Looker IDE.

   ![image35](https://github.com/dataminr/looker-dashboards/assets/138869970/1770a449-2802-40bd-a94d-f14aaf95c474)

6. Select the Settings icon from the navigation bar, and open the Configure Git page by selecting the Configure Git button:

   ![image32](https://github.com/dataminr/looker-dashboards/assets/138869970/8184a68b-fb3c-46bb-b7aa-89759fe4bd65)
  
7. In Looker's Configure Git section, paste the HTTPS URL for dataminr looker dashboard git repository in the Repository URL field, then select Continue.

	In the Repository URL paste the repo which you have forked in Step-1

 	Example: https://github.com/dataminr/forked-project.git

   ![image24](https://github.com/dataminr/looker-dashboards/assets/138869970/c0ed6ab4-259f-44e7-80ec-4fa3da4b6960)

8. Enter github **Username** and **Personal Access Token (PAT)**, then click “Test and Finalize Setup”:

	Note: Make sure the **Personal Access Token (PAT)** you created from your github repository has **Read/Write** permissions of the repository.

      ![image36](https://github.com/dataminr/looker-dashboards/assets/138869970/56421c1d-66fc-4d92-ab14-5d53d46817ce)

9. After successful connection head over to the Project settings page and change the production branch from **master** to **main** and save the configurations.

	![AD_4nXcU68gg2-Tc84AOIuIEvkJPuRjtNfPflTvJuGB3JbLK6tp2myK3jBDR9g6Eq69NWEbkHrTWSjofiGmBgdMEoFcdgfssv9y9s05eD3G1JYh1vqwxvnN_ssg3](https://github.com/dataminr/looker-dashboards/assets/138869970/af4567e8-03a8-4d42-9054-7520057b06b8)

10. Now, you should be able to see the code from master branch. If not then <br>
      a. In the ‘Git Actions’ tab from the left side, click on the “Pull from…” option.

    ![image17](https://github.com/dataminr/looker-dashboards/assets/138869970/6abb00a1-9a7e-4733-906b-0005b19745df)

      b. Select the “Pull From Production” option and click on the Confirm button.

    ![image14](https://github.com/dataminr/looker-dashboards/assets/138869970/6bf11405-5dbc-402c-93cb-fe57a975ba7a)

11. In the ‘File Browser’ tab from the left side, click on ‘manifest.lkml’ and update the value of the following constants and then click “Save Changes”. <br>
      a. **CHRONICLE_URL**: The link of your chronicle tenant where the drill results will be redirected <br>

      ![image38](https://github.com/dataminr/looker-dashboards/assets/138869970/34d6a75b-d557-493b-8e2b-1a849db8dc11)

12. After saving the changes, click on Validate LookML on the top right corner and then click on Commit changes and Push to push the latest changes.

	![AD_4nXekS9B_2p-4mH02hctOF62aANrVt-dsCSP7C5Ce9g3BxnPlu3S414M4uAajbyrrVScxWe4jxZ34UcZcknqw-m23aqrU8icph9CcZEQY-456_dBXG7S7FB23](https://github.com/dataminr/looker-dashboards/assets/138869970/22f2694d-05f6-4200-8dfe-dfe53a8ad54e) <br>
 
	![AD_4nXfOIO0jyAGMs8IjXvEBsGjzIuBpgstHhi-V8hO1xTPsG8dTm0ih9jzrJfebfvQlNtkKNBxvZFTbxJz4rjs9-LYpIZk0nCmlXMLusfJEhpTPF7G0WTFa8I7Q](https://github.com/dataminr/looker-dashboards/assets/138869970/90426432-452b-40ad-929e-634c0a0870e1)

13. After the above steps, In the Git Actions, click on the “Deploy to Production” or you can press “Deploy to Production” from the top right corner:

    ![Commit History](https://github.com/dataminr/looker-dashboards/assets/138869970/1ca4f15b-0ea9-4a26-b68d-4b3ca93b4005) <br><br>
    ![AD_4nXfPvWlO_IgVxOPFsbO52hpZBRy_zUbZs_ayh7BCo0jDW-UuShA7fHsDCRSJmBu61NtjWT-6Tzq7rP5oaVcYWJL8t8L764ntFhGkSVtIfcY4UsXaxOrZZPZV](https://github.com/dataminr/looker-dashboards/assets/138869970/dc89f0e1-f26d-45b0-b1e7-65ac4b5dc32e)

14. On the Homepage of your Looker instance, navigate to the “LookML dashboards” tab under the “Folders” tab to access and view all the created dashboards.

    ![image21](https://github.com/dataminr/looker-dashboards/assets/138869970/7a699346-9359-440c-85e0-714769ef826f)
    <br><br>


## Upgrade

For any future enhancements into Looker Dashboards make sure the repo you forked is in sync with this [dataminr/looker-dashboards](https://github.com/dataminr/looker-dashboards) repo. 

To sync this changes in forked repository from the main repository, make sure to follow the steps below:

1. In the event of any additional changes required for the Dashboards in the future, the main repository will be updated. Once you have created a fork of your repository, you can synchronize it by selecting the "Sync fork" option located at the top of your repo.

	![AD_4nXdLWRYV1i5yYod5t7HbIT728V-x18-sxLPCCkW6LFE7Al3miiXCjlF-7lXhyEbUDHbWIYW4brEdLTByM2iGkbI35nwQsvddaLHkdTVu26RmOD-gbNfI9chu](https://github.com/dataminr/looker-dashboards/assets/138869970/6564b393-8695-4952-a017-7821793719de) <br>

2. After clicking "Sync fork," you'll see an option to either "Discard commit" or "Update branch." Select "Update branch," and your branch will be updated with the latest changes from the main branch.

	<img width="628" alt="AD_4nXfy-036bH4nESnUGymr1raGYpUzcWGz10ovebB3_6n2jjh81gBb3QwjlgeRViw3-fAuZ08gu1YCKjmzM-uJ6ruEUmxinS8DjHoRj-aBsZdtvP6lb_VCBhGx" src="https://github.com/dataminr/looker-dashboards/assets/138869970/e3c37fb3-420c-4dd2-ae27-4a80660f796c"> <br>

#### **Note**: If you don’t see the "Update Branch" option and instead see "Open Pull Request," click the "Discard commits" button. This will discard all your local commits while keeping your changes in your Looker code. After clicking "Discard commits," you will have the latest code changes from the main repository.

3. After completing the steps above, go to your Looker instance and refresh the window. You will then see the option to pull the latest code from production by clicking the "Pull from Production" button in the top right corner. This will update your repo with the latest code from the main branch.

	![AD_4nXdaFSsSqoIenfy4CkneOs2SkujythDEyLZ6V8WYL9CS--JLOaKOXJ_cZ5yNglcQhqxUajliEBP2sG1YFYqr4SdOnj9brmoa4f4yBLdKr9aXBlSywtAAibBi](https://github.com/dataminr/looker-dashboards/assets/138869970/6fb21d67-eea2-4066-825d-b4eb2ced4dd5) <br>

	![AD_4nXfPvWlO_IgVxOPFsbO52hpZBRy_zUbZs_ayh7BCo0jDW-UuShA7fHsDCRSJmBu61NtjWT-6Tzq7rP5oaVcYWJL8t8L764ntFhGkSVtIfcY4UsXaxOrZZPZV](https://github.com/dataminr/looker-dashboards/assets/138869970/d19caed5-9233-41ac-a2c8-808bf7eee1fa) <br>


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
