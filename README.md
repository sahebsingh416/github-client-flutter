# Features

This app can be used to keep track of the commits that are being done on any public repository.

# Prerequisites

1. Flutter SDK v1.12.13+hotfix.5  

    To install flutter in your system please follow the steps on this [link](https://flutter.dev/docs/get-started/install).

2. Add the following dependencies into your _**pubspec.yaml**_ file :

    1. dependencies:
        1. chopper: ^3.0.1+1
        2. provider: ^4.0.1
        3. intl: ^0.16.1

    2. dev_dependencies:
        1. chopper_generator: ^3.0.3
        2. build_runner: (Leave the version blank to get the latest version)

_run flutter packages get_ to add the dependencies in project.

# Flow

The very first screen that you will see is : 

<img align="center" src="https://user-images.githubusercontent.com/52536185/71896464-e1f5af00-3179-11ea-8f11-407d6de169ae.png" width=250 height=500>

Here in the __username__ textfield we need to add our GIt username and in the __reponame__ textfield we need to add the repository name.

After clicking on the __Next__ button we will be navigated to the Homescreen. If the details entered are correct we will see a **commit listing** screen as shown here :

<img align="center" src="https://user-images.githubusercontent.com/52536185/71896158-f5544a80-3178-11ea-9100-3b1ace251886.png" width=250 height=500>

If for some reason the details are incorrect we will see a **No data found** screen : 

<img align="center" src="https://user-images.githubusercontent.com/52536185/71896412-bffc2c80-3179-11ea-838c-077ee847394b.png" width=250 height=500>

We can also refresh this listing by clicking on the **refresh** button on the appbar.








