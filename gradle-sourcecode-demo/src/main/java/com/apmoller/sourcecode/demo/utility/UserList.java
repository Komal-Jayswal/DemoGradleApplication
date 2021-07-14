package com.apmoller.sourcecode.demo.utility;

import java.util.List;

public class UserList {
    public static List<String> getDefaultUserList(List<String> userList){
        userList.add("Maven");
        userList.add("Gradle");
        userList.add("Ant");
        return userList;
    }
}
