package com.company;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.LinkedHashMap;

public class Main {
        public static void main(String[] args) {
            try
            {
                HashMap<String, String[]> map = new LinkedHashMap<String, String[]>();
                BufferedReader in = new BufferedReader(new FileReader("in.txt"));

                String str;
                while((str = in.readLine()) != null){
                    System.out.println(str);
                }
                in.close();
            }
            catch(IOException io)
            {
                io.printStackTrace();
            }
        }
    }


}
