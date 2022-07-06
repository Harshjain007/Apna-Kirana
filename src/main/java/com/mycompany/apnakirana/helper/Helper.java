
package com.mycompany.apnakirana.helper;


public class Helper {
   
    public static String get10Words(String desc){
        String[] strs = desc.split(" ");
        
        if(strs.length > 6){
            String res="";
            for(int i=0;i < 6;i++){
                res=res+strs[i]+" ";
            }
            return (res+"...");
        }else{
            return (desc+"....");
        }
    }
}
